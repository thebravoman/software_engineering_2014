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
	return Array.new($folder_names.size-2)
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
	if !(pdf_name = $pdf_names.select { |element| element.first == pdf_name}).empty?
		pdf_name.each do |info|	
			info = info.last
			names[info] = make_array if names[info].nil?
			names[info][4] = check_date($folders[4].last, full_pdf_name)
		end
	end
	return true
end

def zero_level_checking(short_name, program_name, names)
		names[short_name][0] = 0 unless program_name =~ /\/[a-zA-Z0-9]+_[a-zA-Z0-9]+_(1[1-8]|[1-9])\.[A-Za-z]+\z/ 
		return true if name = names[short_name][0]
		name = Array.new(1, 2) if name.nil?
		name[0] = check_date($folders[4].last, program_name) if name[0] == 2
		name << Integer(program_name.gsub(/.+_|\..+/, ''))
		name = 0 if name.drop(1).uniq != name.drop(1)
		names[short_name][0] = name
		return true
end

starting_time = Time.now

names = Hash.new

runnable_programs = [1, 2, 3, 5, 6]
$folder_names = [" ", " ", "VH", "002", "003", "004", "009", "012", "014", "g2", "g3", "g4", "g12", "g14", "y2", "y3", "y4", "y12", "y14"]
$folders = [["/vhodno_nivo/**/*.*", "1412020800"], ["/class002_homework/*.rb", "1411416000"],
			  ["/class003_homework/*.rb", "1412020800"], ["/class004/*.rb", "1412020800"],
			  ["/class009_homework/*", "1414440000"], ["/class012_homework/*_*_*_*.rb", "1415649600"],
			  ["/class014_homework/*/*_*_*_*.rb", "1415858400"]]

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
	value.map! { |var| var.class == Array ? var[0] : var }
	runnable_programs.each_with_index { |number, index| value[-(5-index)] = -1 if value[number-1] == 0 }
end

runnable_programs.each_with_index do |number, index|
	flay_checking $folders[number][0], ($folders.size + 5 + index), names, index
end

$folder_names[0] = (Time.now - starting_time).to_i

writer = option_picked
writer.write(names, "results_Dimitar_Matev_A_5", $folder_names)
