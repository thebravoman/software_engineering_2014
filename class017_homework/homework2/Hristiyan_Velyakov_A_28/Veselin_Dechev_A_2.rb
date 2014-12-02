require_relative 'csv_writer.rb'
require_relative 'xml_writer.rb'
require_relative 'json_writer.rb'
require_relative 'html_writer.rb'
require_relative "svg_writer.rb"

vhodno_nivo=Array.new
class002=Array.new
class003=Array.new
class004=Array.new
class009=Array.new
class012=Array.new
class014=Array.new
class017=Array.new
teams = Hash.new

repo=ARGV[0]
current_file=0	
start=Time.now	


def check repo, results, homework, deadline
		if homework == "0171"
			path = "#{repo}/class017_homework/homework1/**/*_*_*_*.rb"
		end
		if homework == "0172"
			path = "#{repo}/class017_homework/homework2/**/*_*_*_*.rb"
		end


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
			#flog = `flog #{script_file}`
			results["#{name}"][0] = score
			#results["#{name}"][0] = flog
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
				#flog = `flog #{script_file1}`
			results["#{name}"][1] = score
			#results["#{name}"][1] = flog
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
			#flog = `flog #{script_file2}`
			results["#{name}"][2] = score
			#results["#{name}"][2] = flog
	end 

	Dir.glob("#{repo}class004_homework/*.*") do |script_file3|
	 	firstname=script_file3.split("/").last.split(".").first.split("_")[0]
		lastname=script_file3.split("/").last.split(".").first.split("_")[1]
		name="#{firstname}"+" "+"#{lastname}"
		commit = `git log #{script_file4}`
		if (commit==(`git log --until=Sep--29--2014--20:00:00 #{script_file3}`))
		
		 		score=2
			prints = "#{name}"+" "+"#{score}"
			class004.push(prints)
		elsif

		 (commit!=(`git log --until=Sep--29--2014--20:00:00 #{script_file3}`))

		 		score=1
			prints = "#{name}"+" "+"#{score}"
			class004.push(prints)
		else
		 
		 		score=0	
			prints = "#{name}"+" "+"#{score}"
			class004.push(prints)			
		end 
		#flog = `flog #{script_file3}`
			results["#{name}"][3] = score
			#results["#{name}"][3] = flog

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
Dir.glob(ARGV[0] + "class009_homework/**/*.pdf").each do |script_file4|
	team_name = script_file4.split("/").last.split(".").first
		log = `git log --until=Oct-29-2014-20:00:00 -- #{script_file4}`
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
	#flog = `flog #{script_file5}`
			results["#{name}"][5] = score
			#results["#{name}"][5] = flog		
	end

Dir.glob("#{repo}class014_homework/*.*") do |script_file6|
	 	firstname=script_file6.split("/").last.split(".").first.split("_")[0]
		lastname=script_file6.split("/").last.split(".").first.split("_")[1]
		name="#{firstname}"+" "+"#{lastname}"
		commit = `git log #{script_file6}`
		if (commit==(`git log --until=Nov--13--2014--06:00:00 #{script_file6}`))
		
		 		score=2
			prints = "#{name}"+" "+"#{score}"
			class014.push(prints)
		elsif

		 (commit!=(`git log --until=Nov--13--2014--06:00:00 #{script_file6}`))

		 		score=1
			prints = "#{name}"+" "+"#{score}"
			class014.push(prints)
		else
		 
		 		score=0	
			prints = "#{name}"+" "+"#{score}"
			class014.push(prints)			
		end 
		#flog = `flog #{script_file6}`
			results["#{name}"][6] = score
			#results["#{name}"][6] = flog

	end

Dir.glob("#{repo}/class017_homework/homework1/**/*_*_*_*.rb") do |script_file7|
	 	firstname=script_file7.split("/").last.split(".").first.split("_")[0]
		lastname=script_file7.split("/").last.split(".").first.split("_")[1]
		name="#{firstname}"+" "+"#{lastname}"
		commit = `git log #{script_file7}`
		if (commit==(`git log --until=Dec--02--2014--06:00:00 #{script_file7}`))
		
		 		score=2
			prints = "#{name}"+" "+"#{score}"
			class017.push(prints)
		elsif

		 (commit!=(`git log --until=Dec--02--2014--06:00:00 #{script_file7}`))

		 		score=1
			prints = "#{name}"+" "+"#{score}"
			class017.push(prints)
		else
		 
		 		score=0	
			prints = "#{name}"+" "+"#{score}"
			class017.push(prints)			
		end 
		#flog = `flog #{script_file7}`
			results["#{name}"][7] = score
			#results["#{name}"][7] = flog

	end

Dir.glob("#{repo}/class017_homework/homework2/**/*_*_*_*.rb") do |script_file8|
	 	firstname=script_file8.split("/").last.split(".").first.split("_")[0]
		lastname=script_file8.split("/").last.split(".").first.split("_")[1]
		name="#{firstname}"+" "+"#{lastname}"
		commit = `git log #{script_file8}`
		if (commit==(`git log --until=Dec--02--2014--06:00:00 #{script_file8}`))
		
		 		score=2
			prints = "#{name}"+" "+"#{score}"
			class017.push(prints)
		elsif

		 (commit!=(`git log --until=Dec--02--2014--06:00:00 #{script_file8}`))

		 		score=1
			prints = "#{name}"+" "+"#{score}"
			class017.push(prints)
		else
		 
		 		score=0	
			prints = "#{name}"+" "+"#{score}"
			class017.push(prints)			
		end 
		#flog = `flog #{script_file8}`
			results["#{name}"][8] = score
			#results["#{name}"][8] = flog

	end

end
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
else
abort ("Wrong format argument!")
end
writer.write(results,Time.now - start)
end;
