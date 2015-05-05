require_relative 'csvWriter.rb'
require_relative 'xmlWriter.rb'
require_relative 'htmlWriter.rb'
require_relative 'jsonWriter.rb'
require_relative 'svgWriter.rb'

#----------------------- METHOD FOR MISSING FILES--------------#

def missing(o)
	
	o.keys.each do |k|
	
		for i in 0..5
			
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

#-------------------------- ENTRY DIR -------------------------#

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
		 	
		 	results[name][0] = 2
		
		elsif log.empty?
		 	
		 	results[name][0] = 1
		
		else
		 	
		 	results[name][0] = 0
		
		end
		
	end

end

#-------------------------- CLASS002 DIR -------------------------#

Dir.glob(ARGV[0] + "class002_homework/*.rb").each do |file|

	full_name = file.split("/").last.split("_")

	name = "#{full_name[0].to_s.capitalize} #{full_name[1].to_s.capitalize}"

	log = `git log --until=Sep-22-2014-20:00:00 -- #{file}`
		
	if !log.empty?
		 	
	 	results[name][1] = 2
		
	elsif log.empty?
		 	
	 	results[name][1] = 1
		
	else
		 	
	 	results[name][1] = 0
		
	end

end

#-------------------------- CLASS003 DIR -------------------------#

Dir.glob(ARGV[0] + "class003_homework/*.rb").each do |file|

	full_name = file.split("/").last.split("_")

	name = "#{full_name[0].to_s.capitalize} #{full_name[1].to_s.capitalize}"

	log = `git log --until=Sep-24-2014-20:00:00 -- #{file}`
		
	if !log.empty?
		 	
	 	results[name][2] = 2
		
	elsif log.empty?
		 	
	 	results[name][2] = 1
		
	else
		 	
	 	results[name][2] = 0
		
	end

end

#-------------------------- CLASS004 DIR -------------------------#

Dir.glob(ARGV[0] + "class004/*.rb").each do |file|

	full_name = file.split("/").last.split("_")

	name = "#{full_name[0].to_s.capitalize} #{full_name[1].to_s.capitalize}"

	log = `git log --until=Sep-29-2014-20:00:00 -- #{file}`
		
	if !log.empty?
		 	
	 	results[name][3] = 2
		
	elsif log.empty?
		 	
	 	results[name][3] = 1
		
	else
		 	
	 	results[name][3] = 0
		
	end

end

#-------------------------- CLASS009 DIR --------------------------#

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


#-------------------------- CLASS0012 DIR- ------------------------#

Dir.glob(ARGV[0] + "class012_homework/*.rb").each do |file|

	full_name = file.split("/").last.split("_")

	name = "#{full_name[0].to_s.capitalize} #{full_name[1].to_s.capitalize}"

	log = `git log --until=Nov-10-2014-20:00:00 -- #{file}`
		
	if !log.empty?
		 	
	 	results[name][5] = 2
		
	elsif log.empty?
		 	
	 	results[name][5] = 1
		
	else
		 	
	 	results[name][5] = 0
		
	end

end

missing(results)

file_format = "#{ARGV[1].to_s} #{ARGV[2].to_s}"

case file_format
	
	when "-o csv"
	
		a = CSVWriter.new
		a.write(results)

	when "-o xml"

		a = XMLWriter.new
		a.write(results)

	when "-o json"

		a = JSONWriter.new
		a.write(results)

	when "-o html"

		a = HTMLWriter.new
		a.write(results)

	when "-o svg"

		a = Drawer.new
		a.write(results)
		
end