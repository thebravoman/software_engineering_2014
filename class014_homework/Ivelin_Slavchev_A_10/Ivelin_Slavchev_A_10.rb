require_relative 'csvWriter.rb'
require_relative 'jsonWriter.rb'
require_relative 'htmlWriter.rb'
require_relative 'xmlWriter.rb'
require_relative 'svgWriter.rb'

def missing(o)
	o.keys.each do |k|
		for i in 0..5
			if o[k][i] == nil
			   o[k][i] = 0
			end
		end
	end
end

results = Hash.new { |hash, key| hash[key] = [] }
teams = Hash.new
i = 0

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

contents = CSV.read(ARGV[0] + "class009_homework/project_to_names.csv")
contents.shift			 	
contents.each do |col| 	
	if teams[col[0].to_s] != nil
		cur = teams[col[0].to_s]
		cur << col[1].to_s
		teams[col[0].to_s] = cur
	else
		teams[col[0].to_s] = []
		teams[col[0].to_s] << col[1].to_s
	end
end

Dir.glob(ARGV[0] + "class009_homework/**/*.pdf").each do |file|
	team_name = file.split("/").last.split(".").first
	log = `git log --until=Oct-29-2014-20:00:00 -- #{file}`
	if !log.empty? 	
	 	names = (teams.values_at(team_name)).flatten
		names.each do |s|
			if s == nil
				next
			end
			results[s][4] = 2
		end	
	elsif log.empty?	 	
	 	names = (teams.values_at(team_name)).flatten
		names.each do |s|
			if s == nil
				next
			end
			results[s][4] = 1
		end	
	else	 	
		names = (teams.values_at(team_name)).flatten
		names.each do |s|
			if s == nil
				next
			end
			results[s][4] = 0
		end
	end
end

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
format = ARGV[1].to_s + " " + ARGV[2].to_s 

case format
  	when "-o csv"
  		a = CSVWriter.new
  		a.write(results)
  	when "-o xml"
  		a = XMLWriter.new
  		a.write(results)
  	when "-o html"
  		a = HTMLWriter.new
  		a.write(results)
  	when "-o json"
  		a = JSONWriter.new
  		a.write(results)
  	when "-o svg"
  		a = SVGWriter.new
  		a.write(results)
end