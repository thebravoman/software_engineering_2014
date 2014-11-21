require_relative 'csvWriter.rb'
require_relative 'xmlWriter.rb'
require_relative 'htmlWriter.rb'
require_relative 'jsonWriter.rb'
require_relative 'svgWriter.rb'

#---------------------- REMOVING NEW LINES METHOD -----------------#

def rnl string
	string.delete "\n"
end

def rns string
	string.delete " "
end

start_time = Time.now

#----------------------- METHOD FOR MISSING FILES--------------#

def missing(o)
	
	o.keys.each do |k|
	
		for i in 0..16
			
			if o[k][i] == nil
			   o[k][i] = 0
			end

		end
	
	end

end


#--------------------------- VARIABLES -------------------------#

results = Hash.new { |hash, key| hash[key] = [] }
teams = Hash.new
i = 0

#-------------------------- PARSE ENTRY DIR METHOD -------------------------#


def parseEntryDir results, index
	Dir.glob(ARGV[0] + "vhodno_nivo/*").each do |vh|

		i = 0
			
		Dir.glob("#{vh}/*.*") do |file|
			i += 1
		end
			 
		full_name = vh.split("/").last.split("_")
			 
		if full_name[1].to_s.empty?
			next
		end

		name = "#{full_name[0].to_s.capitalize} #{full_name[1].to_s.capitalize}"
			 
		if i >= 3
		
			log = `git log --until=Sep-17-2014-20:00:00 -- #{vh}`
			
			if !log.empty?
			 	
			 	results[name][index] = 2
			
			elsif log.empty?
			 	
			 	results[name][index] = 1
			
			else
			 	
			 	results[name][index] = 0
			
			end
			
		end

	end
end

#-------------------------- PARSING METHOD -------------------------#

def parseDir location, time, results, index, flog_index, flay_index
	Dir.glob(ARGV[0] + "#{location}/**/*_*_*_*.rb").each do |file|
	
		full_name = file.split("/").last.split("_")

		flog = `flog #{file.to_s}`

		flog_total = flog.split(":").first

		flay = `flay #{ARGV[0]}/#{location}/*.rb | grep #{full_name[0].to_s} | wc -l`

		if location == "class014_homework"

		folder = file.split("/")
		current_folder = folder[folder.size - 2]

		flay = `flay #{ARGV[0]}/#{location}/**/*_*_*_*.rb | grep #{full_name[0].to_s} | wc -l`

	end

	# flay = `cd ~ && cd #{ARGV[0]}/#{location} && flay #{file.to_s}`

	# flay = flay.split("Total score (lower is better) = ").last.split("\n").first

	# puts flay

	name = "#{full_name[0].to_s.capitalize} #{full_name[1].to_s.capitalize}"

	log = `git log --until=#{time} -- #{file}`
   
	if !log.empty?
     
		results[name][index] = 2
   
	elsif log.empty?
     
		results[name][index] = 1
   
	else
     
		results[name][index] = 0
   
	end

	results[name][flog_index] = flog_total.to_s
	results[name][flay_index] = rnl flay
end
 
end
#-------------------------- CLASS009 PARSE --------------------------#

csv_contents = CSV.read(ARGV[0] + "class009_homework/project_to_names.csv")

csv_contents.shift
			 	
csv_contents.each do |row|
				 	
	if teams[row[0].to_s] != nil
		currentUserFiles = teams[row[0].to_s]
		currentUserFiles << row[1].to_s
		teams[row[0].to_s] = currentUserFiles
	else
		teams[row[0].to_s] = []
		teams[row[0].to_s] << row[1].to_s
	end

end

Dir.glob(ARGV[0] + "class009_homework/**/*.pdf").each do |file|

	team_name = file.split("/").last.split(".").first

	log = `git log --until=Oct-29-2014-20:00:00 -- #{file}`

	if !log.empty?
		 	
	 	creator_names = (teams.values_at(team_name)).flatten

		creator_names.each do |s|

			if s == nil
				next
			end

			results[s][4] = 2

		end
		
	elsif log.empty?
		 	
	 	creator_names = (teams.values_at(team_name)).flatten

		creator_names.each do |s|

			if s == nil
				next
			end

			results[s][4] = 1

		end
		
	else
		 	
	 	creator_names = (teams.values_at(team_name)).flatten

		creator_names.each do |s|

			if s == nil
				next
			end

			results[s][4] = 0

		end
		
	end

end

#--------------------------- PARSING THE DIRECTORIES ----------------------#
parseEntryDir results, 0
parseDir "class002_homework", "Sep-22-2014-20:00:00", results, 1, 7, 12
parseDir "class003_homework", "Sep-24-2014-20:00:00", results, 2, 8, 13
parseDir "class004", "Sep-29-2014-20:00:00", results, 3, 9, 14
parseDir "class012_homework", "Nov-10-2014-20:00:00" , results, 5, 10, 15
parseDir "class014_homework", "Nov-13-2014-06:00:00" , results, 6, 11, 16

missing(results)

end_time = Time.now - start_time

puts end_time


#---------------------------- OUTPUT FORMAT CASE --------------------------#

file_format = "#{ARGV[1].to_s} #{ARGV[2].to_s}"

case file_format
	
	when "-o csv"
	
		a = CSVWriter.new
		a.write(results, end_time)

	when "-o xml"

		a = XMLWriter.new
		a.write(results, end_time)

	when "-o json"

		a = JSONWriter.new
		a.write(results, end_time)

	when "-o html"

		a = HTMLWriter.new
		a.write(results, end_time)

	when "-o svg"

		a = Drawer.new
		a.write(results, end_time)
		
end
