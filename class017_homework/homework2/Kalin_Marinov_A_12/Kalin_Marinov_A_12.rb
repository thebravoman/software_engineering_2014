require_relative 'csv_writer.rb'
require_relative 'html_writer.rb'
require_relative 'xml_writer.rb'
require_relative 'json_writer.rb'
require_relative 'svg_writer.rb'

def check_date(date, file)
	`git log --reverse --format=%at "#{ file }"` < date ? 2 : 1
end

def get_short_name name
	name.gsub(/\A.+\/|_[^\/_]+\z|_/, '_' => ' ', /.+/ => '').scan(/\A[\S]+ [\S]+/).first
end

def make_array 
	Array.new($folder_names.size-2)
end

def option_picked
	case ARGV[-2] + " " + ARGV[-1]
	when "-o csv" then CSVWriter.new
	when "-o xml" then XMLWriter.new
	when "-o json" then JSONWriter.new
	when "-o html" then HTMLWriter.new
	when "-o svg" then SVGWriter.new
	end
end

def flay_checking path, index_save, names, index_from_start
	temp_array = `flay #{ ARGV[0] + path }`.split(ARGV[0])
	temp_array.each do |info|
		person = get_short_name info
		next unless person =~ /\A[A-Z][a-z]+ [A-Z][a-z]+\z/
		names[person][index_save] += 1
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

runnable_programs = [1, 2, 3, 5, 6, 7, 8]
size_runnable_programs = runnable_programs.size
$folder_names = [" ", " ", "VH", "002", "003", "004", "009", "012", "014", "017_1", "017_2", "g2", "g3", "g4", "g12", "g14", "g17_1", "g17_2", "y2", "y3", "y4", "y12", "y14", "y17_1", "y17_2",]
$folders = [["/vhodno_nivo/**/*.*", "1412020800"], ["/class002_homework/*.rb", "1411416000"],
			  ["/class003_homework/*.rb", "1412020800"], ["/class004/*.rb", "1412020800"],
			  ["/class009_homework/*", "1414440000"], ["/class012_homework/*_*_*_*.rb", "1415649600"],
			  ["/class014_homework/*/*_*_*_*.rb", "1415858400"], ["class017_homework/homework1/*_*_*_*.rb", "1417543200"],
			  ["class017_homework/homework2/*/*_*_*_*.rb", "1417543200"]]

$pdf_names = File.read(ARGV[0] + "/class009_homework/project_to_names.csv").split("\n").drop(1).map{ |element| element.split(",") }
add = 0
$folders.size.times do |count|
	Dir.glob(ARGV[0] + $folders[count][0]) do |program_name|
		next if count == 4 && pdf_checking(program_name, names)
		short_name = get_short_name program_name
		next unless short_name =~ /\A[A-Z][a-z]+ [A-Z][a-z]+\z/
		names[short_name] = make_array if names[short_name].nil? 
		next if count == 0 && zero_level_checking(short_name, program_name, names)
		names[short_name][count] = check_date($folders[count].last, program_name)	
		names[short_name][$folders.size + add] = `flog #{ program_name } -q -s`.to_i
	end
	add += 1 if runnable_programs.include? count
end

names = Hash[names.sort_by { |k,v| k }].each do |key, value| 
	value.map! { |var| var.nil? ? 0 : var }
	temp_number = value[0]
	value[0] = temp_number.uniq.size >= 3 ? temp_number[0] : 0 if temp_number.class == Array
	(0...size_runnable_programs).each { |index| value[(index-size_runnable_programs)] = -1 if value[index-(size_runnable_programs*2)] == 0}
end

runnable_programs.each_with_index do |number, index|
	flay_checking $folders[number][0], ($folders.size + size_runnable_programs + index), names, index
end

$folder_names[0] = (Time.now - starting_time).to_i

writer = option_picked
writer.write(names, "results_Kalin_Marinov_A_12", $folder_names)
