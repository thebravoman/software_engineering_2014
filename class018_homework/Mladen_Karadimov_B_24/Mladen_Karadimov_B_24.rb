require_relative "xml_writer.rb"
require_relative "csv_writer.rb"
require_relative "json_writer.rb"
require_relative "html_writer.rb"
#require_relative "svg_writer.rb"
require_relative "check_homeworks.rb"
require_relative "other_functions.rb"
require 'yaml'
######
#
#run: ruby script.rb /home/*user*/*repo*/ -o *fileformat*
#
######
startTime = Time.now

HOMEWORKS = YAML.load_file("config.yml")["homeworks"]
DEADLINES = YAML.load_file("config.yml")["deadlines"]
FLOG = YAML.load_file("config.yml")["flog"]
FLAY = YAML.load_file("config.yml")["flay"]
FILENAME = (YAML.load_file("config.yml")["filename"]).to_s
REPO = ARGV[0]
$results = Hash.new


if ARGV[1] == "-o"
	case ARGV[2]
		when "xml"
			writer = XMLWriter.new
		when "svg"
			writer = SVGWriter.new
		when "csv"
			writer = CSVWriter.new
		when "html"
			writer = HTMLWriter.new
		when "json"
			writer = JSONWriter.new
		else
			abort "Cannot write in #{ARGV[2]}!"
	end
end

$timeSaver = false # Check only the first 2 programs

if (ARGV[3] == "-n") && (ARGV[4].to_i != 0)
	$timeSaver = true
	puts "Time Saver - ON"
else
	puts "Time Saver - OFF"
end


HOMEWORKS.keys.each do |hw|
	flayRes = `flay #{REPO + HOMEWORKS[hw].split('/').first + '/'}`
	checkHomework(hw, HOMEWORKS[hw], DEADLINES[hw],flayRes)
end

$results  = $results.sort

executionTime = Time.now - startTime


writer.write($results, FILENAME, executionTime)

