require_relative "csv_writer.rb"
require_relative "xml_writer.rb"
require_relative "json_writer.rb"
require_relative "html_writer.rb"
require_relative "svg_writer.rb"

vhodno_nivo=Array.new
class002=Array.new
class003=Array.new
class004=Array.new
class012=Array.new
repo=ARGV[0]
current_file=0	
time_start=Time.now	
results = Hash.new{|key, value| key[value] = []}
Dir.glob("#{repo}/*.*") do |folder|		
i=0
		Dir.glob("#{repo}vhodno_nivo/*.*") do |script_file|
		i+=1
	Dir.glob("script_file/*.*") do |file|
end 
	if i>=3 
	firstname=script_file.split("/").last.split(".").first.split("_")[0]
	lastname=script_file.split("/").last.split(".").first.split("_")[1]
	name="#{firstname} #{lastname}"	
end 
        commit = `git log #{script_file}`
		if (commit!=(`git log --until=17.Sep.2014--20:00:00 #{script_file}`))
			score=2
			prints = "#{name}"+" "+"#{score}"
			vhodno_nivo.push(prints) 
		elsif
			 (commit==(`git log --until=17.Sep.2014--20:00:00 #{script_file}`))
	 		score=1
			prints = "#{name}"+" "+"#{score}"
			vhodno_nivo.push(prints)
		else	
 			score=0	
			prints = "#{name}"+" "+"#{score}"
			vhodno_nivo.push(prints)			
	   	end 
			flog = `flog #{script_file}`
			results["#{name}"][0] = score
			results["#{name}"][0] = flog
end
	
	Dir.glob("#{repo}class002_homework/*.*") do |script_file1|
		firstname=script_file1.split("/").last.split(".").first.split("_")[0]
		lastname=script_file1.split("/").last.split(".").first.split("_")[1]
		name="#{firstname}"+" "+"#{lastname}"
	 	commit = `git log #{script_file1}`
		
			if (commit==(`git log --until=Sep--22--2014--20:00:00 #{script_file1}`))
			
	 		score=2
				prints = "#{name}"+" "+"#{score}"
				class002.push(prints)
			elsif

			 (commit!=(`git log --until=Sep--22--2014--20:00:00 #{script_file1}`))
	
			 		score=1
				prints = "#{name}"+" "+"#{score}"
				class002.push(prints)
			else
			 		score=0	
				prints = "#{name}"+" "+"#{score}"
				class002.push(prints)			
			end 
				flog = `flog #{script_file1}`
			results["#{name}"][1] = score
			results["#{name}"][1] = flog
		end
	Dir.glob("#{repo}class003_homework/*.*") do |script_file2|
		firstname=script_file2.split("/").last.split(".").first.split("_")[0]
		lastname=script_file2.split("/").last.split(".").first.split("_")[1]
		name="#{firstname}"+" "+"#{lastname}"
		 commit = `git log #{script_file2}`
			if (commit==(`git log --until=Sep--24--2014--20:00:00 #{script_file2}`))
			
			 		score=2
				prints = "#{name}"+" "+"#{score}"
				class003.push(prints)
			elsif
			 (commit!=(`git log --until=Sep--24--2014--20:00:00 #{script_file2}`))
				    
			 		score=1
				prints = "#{name}"+" "+"#{score}"
				class003.push(prints)
			else

			 		score=0	
				prints = "#{name}"+" "+"#{score}"
				class003.push(prints)			
			
					
			end		
			flog = `flog #{script_file1}`
			results["#{name}"][2] = score
			results["#{name}"][2] = flog
	end 

	Dir.glob("#{repo}class004_homework/*.*") do |script_file4|
	 	firstname=script_file4.split("/").last.split(".").first.split("_")[0]
		lastname=script_file4.split("/").last.split(".").first.split("_")[1]
		name="#{firstname}"+" "+"#{lastname}"
		commit = `git log #{script_file4}`
		if (commit==(`git log --until=Sep--29--2014--20:00:00 #{script_file4}`))
		
		 		score=2
			prints = "#{name}"+" "+"#{score}"
			class004.push(prints)
		elsif

		 (commit!=(`git log --until=Sep--29--2014--20:00:00 #{script_file4}`))

		 		score=1
			prints = "#{name}"+" "+"#{score}"
			class004.push(prints)
		else
		 
		 		score=0	
			prints = "#{name}"+" "+"#{score}"
			class004.push(prints)			
		end 
		flog = `flog #{script_file4}`
			results["#{name}"][3] = score
			results["#{name}"][3] = flog

	end 

	Dir.glob("#{repo}class012_homework/*.*") do |script_file5|
	firstname=script_file5.split("/").last.split(".").first.split("_")[0]
		lastname=script_file5.split("/").last.split(".").first.split("_")[1]
		name="#{firstname}"+" "+"#{lastname}"
	 commit = `git log #{script_file5}`
		if (commit==(`git log --until=Sep--22--2014--20:00:00 #{script_file5}`))
				score=2
			prints = "#{name}"+" "+"#{score}"
			class012.push(prints)
		elsif
				(commit!=(`git log --until=Sep--22--2014--20:00:00 #{script_file5}`))
				score=1
			prints = "#{name}"+" "+"#{score}"
			class012.push(prints)
		else
		 		score=0	
			prints = "#{name}"+" #{score}"
			class012.push(prints)			
		end 
	flog = `flog #{script_file5}`
			results["#{name}"][4] = score
			results["#{name}"][4] = flog		
	end
end
puts Time.now-time_start
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
else
abort("Shitty error!")
end
writer.write(results, flog)
end
