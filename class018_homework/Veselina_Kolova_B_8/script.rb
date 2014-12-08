startTime = Time.now
require 'yaml'
require_relative 'csv_writer.rb'
require_relative 'json_writer.rb'
require_relative 'html_writer.rb'
require_relative 'xml_writer.rb'
require_relative 'svg_writer.rb'

currentDir = Dir.getwd
@results = Hash.new

@classes = YAML.load_file("config.yml")
@teamms = YAML.load_file("st_config.yml")["teams&mmbs"]
@st = YAML.load_file("st_config.yml")["student_configuration"]


def if_set_student(sfs)
	if @results[sfs] == nil
		@results[sfs] = @st
	end
end

def split(sf)
	if sf.split('_').length >= 2 then
		fn = sf.split("_")[0].capitalize
		ln = sf.split("_")[1].capitalize
		sp = "#{fn}" + "_" + "#{ln}"
		return sp
	else
		return sf
	end
end



@classes.keys.each do |k|
	Dir.glob("#{ARGV[0]}#{@classes[k].first}").each do |f|
		sf = f.split('/').last.split('.').first
		sfs = split(sf)
			case k
				when "VH"
					next
				when "009"
					next
				else
					if_set_student(sfs)
					@results[sfs][k] = 1
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
