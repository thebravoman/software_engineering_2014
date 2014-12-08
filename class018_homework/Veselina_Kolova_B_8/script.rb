startTime = Time.now
require 'yaml'
require_relative 'csv_writer.rb'
require_relative 'json_writer.rb'
require_relative 'html_writer.rb'
require_relative 'xml_writer.rb'
require_relative 'svg_writer.rb'

currentDirectory = Dir.getwd
@results = Hash.new

@classes = YAML.load_file("config.yml")
@teamms = YAML.load_file("st_config.yml")["teams&mmbs"]
@student_set = YAML.load_file("st_config.yml")["student_configuration"] #sets all HW to 0 & g & y to -


def if_set_student(sfs) #	checks if there's already hash for that student's HW results in results. if there's not, a new one's created.
	if @results[sfs] == nil
		@results[sfs] = @student_set
	end
end

def split(st_name)
	if st_name.split('_').length >= 2 then
		fn = st_name.split("_")[0].capitalize
		ln = st_name.split("_")[1].capitalize
		new_st_name = "#{fn}" + "_" + "#{ln}"
		return new_st_name
	else
		return st_name # probably a 009 HW file
	end
end



@classes.keys.each do |k|
	Dir.glob("#{ARGV[0]}#{@classes[homework].first}").each do |file|
		short_file_name = file.split('/').last.split('.').first
		st_name = split(short_file_name) #st_name ->> student name (format First_Last)
			case homework
				when "VH"
					next
				when "009"
					next
				else
					if_set_student(st_name)
					@results[st_name][homework] = 1
			end
	end
end



time = Time.now - startTime

if "#{ARGV[1]}" == "-o" then
	if ARGV[2] then
		case ARGV[2]
			when "csv"
				writer = CSVWriter.new
				writer.write(@results, time)
			when "json"
				writer = JSONWriter.new
				writer.write(@results)
			when "html"
				writer = HTMLWriter.new
				writer.write(@results)
			when "xml"
				writer = XMLWriter.new
				writer.write(@results)
			when "svg"
				writer = SVGWriter.new
				writer.write(@results)
			else
				puts "ERROR."
		end
	end
end
