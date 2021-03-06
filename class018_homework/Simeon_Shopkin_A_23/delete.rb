require_relative "html_writer.rb"
results = Hash.new
def homework_check1415(results, path, comtime, clas)


Dir.glob(ARGV[0]+"/#{path}/**/*_*_*_*.rb") do |fixture|	
		
	file_name = fixture.split("/").last
	first_last = file_name.split("_")[0] + " " + file_name.split("_")[1]
	results[first_last] = Hash.new	
	commit_time = `git log #{file_name}`	
	if (commit_time==(`#{comtime} #{file_name}`)) #if (commit_time==(`git log --until=Nov--13--2014--06:00:00 #{file_name}`))
		results[first_last]["#{clas}"] = 2 #["014"]
		break
	else
		results[first_last]["#{clas}"] = 1
		break
	end
end

end
homework_check1415(results, "/class002_homework/", 'git log --until=Sep--22--2014--20:00:00', "002")
homework_check1415(results, "/class003_homework/", 'git log --until=Sep--24--2014--20:00:00', "003")
writer = HTMLWriter.new
writer.write(results)	
