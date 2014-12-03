require_relative 'csv_writer.rb'
require_relative 'html_writer.rb'
require_relative 'xml_writer.rb'
require_relative 'json_writer.rb'
require_relative 'svg_writer.rb'
require 'yaml'

def check_date(date, file)
	`git log --reverse --format=%at "#{ file }"` < date ? 2 : 1
end

def get_short_name name
	name[-1] = '' if name[-1] == "/"
	name.gsub(/\A.+\/|_[^\/_]+\z|_/, '_' => ' ', /.+/ => '').scan(/\A[\S]+ [\S]+/).first
end

def make_array 
	Array.new($folder_names.size-2)
end

def option_picked
	case ARGV[1] + " " + ARGV[2]
	when "-o csv" then CSVWriter.new
	when "-o xml" then XMLWriter.new
	when "-o json" then JSONWriter.new
	when "-o html" then HTMLWriter.new
	when "-o svg" then SVGWriter.new
	end
end

def pdf_checking(full_pdf_name, names)
	pdf_name = full_pdf_name.gsub(/.+\/|\..+/, '')
	$pdf_names.select { |element| element.first == pdf_name}.each do |_, info|	
		names[info] = make_array if names[info].nil?
		names[info][4] = check_date($folders[4].last, full_pdf_name)
	end
	return true
end

def zero_level_checking(short_name, program_name, names)
		names[short_name][0] = 0 unless program_name =~ /\/[a-zA-Z0-9]+_[a-zA-Z0-9]+_([1-9]|1[0-8])\.[A-Za-z]+\z/ 
		name = names[short_name][0]
		return true if name == 0
		name = Array.new(1, 2) if name.nil?
		name[0] = check_date($folders[4].last, program_name) if name[0] == 2
		name << Integer(program_name.gsub(/.+_|\..+/, ''))
		names[short_name][0] = name
		return true
end

starting_time = Time.now

names = Hash.new
get_info = YAML.load(File.open("config.yml", "r"))

runnable_programs = get_info['runnable_programs'].split(', ').map { |program| program.to_i }
size_runnable_programs = runnable_programs.size

$folder_names = get_info['homework_names'].split(', ').map { |string| string.gsub(/[^\d\w]/, '') }
$folders = get_info["folders"].to_a

$pdf_names = File.read(ARGV[0] + get_info['presentation']).split("\n").drop(1).map{ |element| element.split(",") }
add = 0
$folders.size.times do |count|
	check_n_students = ARGV[4].nil? ? -1 : ARGV[4].to_i+1
	Dir.glob(ARGV[0] + $folders[count][0]) do |program_name|
		break if (check_n_students > 0 && (check_n_students-=1) == 0)
		next if count == 4 && pdf_checking(program_name, names)
		short_name = get_short_name program_name
		next unless short_name =~ /\A[A-Z][a-z]+ [A-Z][a-z]+\z/
		names[short_name] = make_array if names[short_name].nil? 
		next if count == 0 && zero_level_checking(short_name, program_name, names)
		names[short_name][count] = check_date($folders[count].last, program_name)	
		names[short_name][$folders.size + add] = `flog #{ program_name }* -q -s`.to_i
		names[short_name][$folders.size + add + size_runnable_programs] = `flay #{ program_name }* -s`.scan(/\d+/).first.to_i	
	end
	add += 1 if runnable_programs.include? count
end

names = Hash[names.sort_by { |k,v| k }].each do |key, value| 
	value.map! { |var| var.nil? ? 0 : var }
	temp_number = value[0]
	value[0] = temp_number.uniq.size >= 3 ? temp_number[0] : 0 if temp_number.class == Array
	(0...size_runnable_programs).each { |index| value[(index-size_runnable_programs)] = -1 if value[index-(size_runnable_programs*2)] == 0}
end

$folder_names[0] = (Time.now - starting_time).to_i

writer = option_picked
writer.write(names, get_info["result_file_name"], $folder_names)
