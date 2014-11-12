load 'csv_writer.rb'
load 'html_writer.rb'
load 'xml_writer.rb'
load 'json_writer.rb'
load 'svg_writer.rb'

def check_date(date, file)
	`git log --reverse --format=%at "#{ file }"` < date ? 2 : 1
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

def pdf_checking(full_pdf_name, names)
	pdf_name = full_pdf_name.split("/").last.split(".").first
	if !(pdf_name = $pdf_names.select { |element| element.split(",").first == pdf_name}).empty?
		pdf_name.each do |info|
			info = info.split(",")[1]
			names[info] = Array.new($folders.size) if names[info].nil?
			names[info][4] = check_date($folders[4].last, full_pdf_name)
		end
	end
	return 
end

def zero_level_checking(short_name, program_name, names)
		names[short_name][0] = 0 unless program_name =~ /\/[a-zA-Z0-9]+_[a-zA-Z0-9]+_(1[1-8]|[1-9])\.[A-Za-z]+\z/ 
		return if names[short_name][0] == 0
		names[short_name][0] = Array.new(1, 2) if names[short_name][0].nil?
		names[short_name][0][0] = check_date($folders[4].last, program_name) if names[short_name][0][0] == 2
		names[short_name][0] << Integer(program_name.split("/").last.split("_")[2].split(".").first)
		names[short_name][0] = 0 if names[short_name][0].drop(1).uniq != names[short_name][0].drop(1)
		return 
end

names = Hash.new

$folders = [["/vhodno_nivo/**/*.*", "1412020800"], ["/class002_homework/*.rb", "1411416000"],
			  ["/class003_homework/*.rb", "1412020800"], ["/class004/*.rb", "1412020800"],
			  ["/class009_homework/*", "1414440000"], ["/class012_homework/*.rb", "1415649600"]]

$pdf_names = File.read(ARGV[0] + "/class009_homework/project_to_names.csv").split("\n").drop(1)

$folders.size.times do |count|
	Dir.glob(ARGV[0] + $folders[count][0]) do |program_name|
		next if count == 4 && pdf_checking(program_name, names).nil?
		short_name = program_name.split('/').last.split("_").first(2).join(" ")
		next unless short_name =~ /\A[A-Z][a-z]+ [A-Z][a-z]+\z/
		names[short_name] = Array.new($folders.size) if names[short_name].nil?
		next if count == 0 && zero_level_checking(short_name, program_name, names).nil? 
		names[short_name][count] = check_date($folders[count].last, program_name)	
	end
end

names = names.each { |key, value| value.map! { |var| var.nil? ? 0 : var }.map! { |var| var.class == Array ? var[0] : var } }.sort_by{ |key, value| key }
writer = option_picked
writer.write(names, "results_Dimitar_Matev_A_5")
