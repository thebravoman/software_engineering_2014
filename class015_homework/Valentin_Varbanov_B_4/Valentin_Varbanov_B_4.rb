#require_relative "xml_writer.rb"
require_relative "csv_writer.rb"
#require_relative "json_writer.rb"
#require_relative "html_writer.rb"
#require_relative "svg_writer.rb"
require_relative "check_homeworks.rb"
require_relative "other_functions.rb"
######
#
#run: ruby script.rb /home/*user*/*repo*/ -o *fileformat*
#
######
startTime = Time.now
HOMEWORKS = Hash[	"vhodno_nivo" => "vhodno_nivo/**/*_*_*.*",
					"002" => "class002_homework/*_*_*_*.rb", 
					"003" => "class003_homework/*_*_*_*.rb", 
					"004" => "class004/*_*_*_*.rb", 
					"009" => "class009_homework/", 
					"012" => "class012_homework/*_*_*_*.rb", 
					"014" => "class014_homework/**/*_*_*_*.rb"]		
								
DEADLINES = Hash[	"vhodno_nivo" => "Sep--17--2014--20:00:00",
					"002" => "Sep--22--2014--20:00:00", 
					"003" => "Sep--24--2014--20:00:00", 
					"004" => "Sep--29--2014--20:00:00", 
					"009" => "Oct--27--2014--20:00:00", 
					"012" => "Nov--10--2014--20:00:00", 
					"014" => "Nov--13--2014--06:00:00"]
					
FLOG = Hash[	"002" => "g2", 
				"003" => "g3", 
				"004" => "g4", 
				"012" => "g12", 
				"014" => "g14"]		
						
FLAY = Hash[	"002" => "y2", 
				"003" => "y3", 
				"004" => "y4", 
				"012" => "y12", 
				"014" => "y14"]
REPO = ARGV[0]
FILENAME = "results_Valentin_Varbanov_B_4"
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

