require_relative "xml_writer.rb"
require_relative "csv_writer.rb"
require_relative "json_writer.rb"
require_relative "html_writer.rb"
#require_relative "svg_writer.rb"
require_relative "check_homeworks.rb"
require_relative "other_functions.rb"
######
#
#run: ruby script.rb /home/*user*/*repo*/ -o *fileformat*
#
######
require 'yaml'
startTime = Time.now
HOMEWORKS = YAML.load_file('config-homeworks.yml')	
								
DEADLINES = YAML.load_file('config-deadlines.yml')
					
FLOG = YAML.load_file('config-flog.yml')
						
FLAY = YAML.load_file('config-flay.yml')

REPO = ARGV[0]
FILENAME = "results_Gergan_Nikolov_B_11"
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


HOMEWORKS.keys.each do |hw|
	flayRes = `flay #{REPO + HOMEWORKS[hw].split('/').first + '/'}`
	checkHomework(hw, HOMEWORKS[hw], DEADLINES[hw],flayRes)
end

$results  = $results.sort

executionTime = Time.now - startTime


writer.write($results, FILENAME, executionTime)

