require_relative 'csvWriter.rb'
require_relative 'xmlWriter.rb'
require_relative 'htmlWriter.rb'
require_relative 'jsonWriter.rb'
require_relative 'svgWriter.rb'

def rnl string
	string.delete "\n"
end

def rns string
	string.delete " "
end

start_time = Time.now

def missing(o)
	o.keys.each do |k|
		for i in 0..16
			if o[k][i] == nil
			   o[k][i] = 0
			end
		end	
	end
end

results = Hash.new { |hash, key| hash[key] = [] }
teams = Hash.new
i = 0

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

def parseDir location, time, results, index, flog_index, flay_index
	Dir.glob(ARGV[0] + "#{location}/**/*_*_*_*.rb").each do |file|		
		full_name = file.split("/").last.split("_")
		flog = `flog #{file.to_s}`
		flog_total = flog.split(":").first
		flay = `flay #{ARGV[0]}/#{location}/*.rb | grep #{full_name[0].to_s} | wc -l`		
		if location == "class014_homework"
			flay = `flay #{ARGV[0]}/#{location}/**/*_*_*_*.rb  | grep #{full_name[0].to_s} | wc -l`
		end	
		name = "#{full_name[0].to_s.capitalize} #{full_name[1].to_s.capitalize}"
		log = `git log --until=#{time} -- #{file}`	
		if !log.empty?	 	
		 	results[name][index] = 2	
		elsif log.empty?	 	
		 	results[name][index] = 1
		else			 	
		 	results[name][index] = 0			
		end		
		results[name][flog_index] = rns flog_total
		results[name][flay_index] = rnl flay			
	end	
end

content = CSV.read(ARGV[0] + "class009_homework/project_to_names.csv")
content.shift			 	
content.each do |col|				 	
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

parseEntryDir results, 0
parseDir "class002_homework", "Sep-22-2014-20:00:00", results, 1, 7, 12
parseDir "class003_homework", "Sep-24-2014-20:00:00", results, 2, 8, 13
parseDir "class004", "Sep-29-2014-20:00:00", results, 3, 9, 14
parseDir "class012_homework", "Nov-10-2014-20:00:00" , results, 5, 10, 15
parseDir "class014_homework", "Nov-13-2014-06:00:00" , results, 6, 11, 16

missing(results)
end_time = Time.now - start_time
format = "#{ARGV[1].to_s} #{ARGV[2].to_s}"
case format
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
		a = SVGWriter.new
		a.write(results, end_time)	
end
