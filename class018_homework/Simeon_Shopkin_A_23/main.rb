require_relative "on_time.rb"
require_relative "get_name.rb"
require_relative "002_003.rb"
require_relative "csv_writer.rb"
require_relative "json_writer.rb"
require_relative "xml_writer.rb"
require_relative "html_writer.rb"
require_relative "svg_writer.rb"
require "yaml"
starting_time=Time.now
results=Hash.new
CSV.foreach(ARGV[0]+"/class009_homework/project_to_names.csv") do |name|	
	vh=name[1].split
	flname=vh[0]+"_"+vh[1]
	results[flname] = Hash.new
	check1(results, flname, "/class002_homework/", 'git log --until=Sep--22--2014--20:00:00', "002")
	check1(results, flname, "/class003_homework/", 'git log --until=Sep--24--2014--20:00:00', "003")




















end
if ARGV[1] == "-o"
	case ARGV[2]
		when "csv"
			writer = CSVWriter.new
		when "xml"
			writer = XMLWriter.new
		when "json"
			writer = JSONWriter.new
		when "html"
			writer = HTMLWriter.new
		when "svg"
			writer = SVGWriter.new
	end
end
t = (Time.now - starting_time).to_s
puts t
