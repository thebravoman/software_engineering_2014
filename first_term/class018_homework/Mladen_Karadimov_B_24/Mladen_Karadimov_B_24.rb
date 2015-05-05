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
#run: ruby script.rb /home/*user*/*repo*/ -o *fileformat* -n *number(optional)*
#
######
startTime = Time.now

REPO = ARGV[0]

yaml = YAML.load_file(REPO + "class018_homework/Mladen_Karadimov_B_24/config.yml")

HOMEWORKS = yaml["homeworks"]
DEADLINES = yaml["deadlines"]
FLOG = yaml["flog"]
FLAY = yaml["flay"]
FILENAME = yaml["filename"].to_s
ORDER = yaml["order"]

$results = Hash.new

puts "Config loaded successfully."

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
else
	abort "Program executed with wrong arguments."
end

$timeSaver = false # Check only the first 2 programs

if (ARGV[3] == "-n") && (ARGV[4].to_i != 0)
	$timeSaver = true
	puts "Time Saver - ON."
else
	puts "Time Saver - OFF."
end

HOMEWORKS.keys.each do |hw|
	puts "Checking homework #{hw} ..."
	flayRes = `flay #{REPO + HOMEWORKS[hw].split('/').first + '/'} 2>/dev/null`
	checkHomework(hw, HOMEWORKS[hw], DEADLINES[hw],flayRes)
	print "\r" + ("\e[A\e[K") # Delete 1 line
	puts "Homework #{hw} checked."
end

$results  = $results.sort

executionTime = Time.now - startTime

writer.write($results, FILENAME, ORDER, executionTime)
puts "Results written in .#{ARGV[2]} file."
