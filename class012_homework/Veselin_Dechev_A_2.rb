require 'csv'
vhodno_nivo=Array.new
class002=Array.new
class003=Array.new
class004=Array.new
class009=Array.new
class012=Array.new
repo=ARGV[0]	
results=Array.new
	
Dir.glob("#{repo}/*.*") do |folder|		

Dir.glob("#{repo}vhodno_nivo/*.*") do |script_file|

 commit = `git log #{script_file}`
		
		if (commit==(`git log --until=Sep--17--2014--20:00:00 #{script_file}`))

fullname=script_file.split("/").last.split(".").first
 		score=2
	print = fullname+ "," +score
	vhodno_nivo.push(print) 
elsif
		 (commit!=(`git log --until=Sep--17--2014--20:00:00 #{script_file}`))
	fullname=script_file.split("/").last.split(".").first
 		score=1
	print = fullname+ "," +score
	vhodno_nivo.push(print)
elsif
	fullname=script_file.split("/").last.split(".").first 
 score=0	
	print = fullname+ "," +score
	vhodno_nivo.push(print)			
	   puts vhodno_nivo
		 end 
end

Dir.glob("#{repo}class002_homework/*.*") do |script_file1|
 commit = `git log #{script_file1}`
		
		if (commit==(`git log --until=Sep--22--2014--20:00:00 #{script_file1}`))
			fullname=script_file1.split("/").last.split(".").first
 		score=2
	print = fullname+ "," +score
	class002.push(print)
elsif

 (commit!=(`git log --until=Sep--22--2014--20:00:00 #{script_file1}`))
	fullname=script_file1.split("/").last.split(".").first
 		score=1
	print = fullname+ "," +score
	class002.push(print)
elsif
 
fullname=script_file1.split("/").last.split(".").first
 score=0	
	print = fullname+ "," +score
	class002.push(print)			
		end 
	end
Dir.glob("#{repo}class003_homework/*.*") do |script_file2|
 commit = `git log #{script_file2}`
		
		if (commit==(`git log --until=Sep--24--2014--20:00:00 #{script_file2}`))
			fullname=script_file2.split("/").last.split(".").first
 		score=2
	print = fullname+ "," +score
	class003.push(print)
elsif
 (commit!=(`git log --until=Sep--24--2014--20:00:00 #{script_file2}`))
	    fullname=script_file2.split("/").last.split(".").first
 		score=1
	print = fullname+ "," +score
	class003.push(print)
elsif 
fullname=script_file2.split("/").last.split(".").first
 score=0	
	print = fullname+ "," +score
	class003.push(print)			
			
		        	
	end		
end 

Dir.glob("#{repo}class004_homework/*.*") do |script_file4|
 commit = `git log #{script_file4}`
		
		if (commit==(`git log --until=Sep--29--2014--20:00:00 #{script_file4}`))
			fullname=script_file4.split("/").last.split(".").first
 		score=2
	print = fullname+ "," +score
	class004.push(print)
elsif

 (commit!=(`git log --until=Sep--29--2014--20:00:00 #{script_file4}`))
	fullname=script_file4.split("/").last.split(".").first
 		score=1
	print = fullname+ "," +score
	class004.push(print)
elsif
 
fullname=script_file4.split("/").last.split(".").first
 score=0	
	print = fullname+ "," +score
	class004.push(print)			
		end 
	end 

Dir.glob("#{repo}class012_homework/*.*") do |script_file1|
 commit = `git log #{script_file5}`
		
		if (commit==(`git log --until=Sep--22--2014--20:00:00 #{script_file5}`))
			fullname=script_file5.split("/").last.split(".").first
 		score=2
	print = fullname+ "," +score
	class012.push(print)
elsif

 (commit!=(`git log --until=Sep--22--2014--20:00:00 #{script_file5}`))
	fullname=script_file5.split("/").last.split(".").first
 		score=1
	print = fullname+ "," +score
	class012.push(print)
elsif
 
fullname=script_file5.split("/").last.split(".").first
 score=0	
	print = fullname+ "," +score
	class012.push(print)			
		end 
	end		
end
CSV.open("result.csv", "w") do |csv|
	(vhodno_nivo).sort.each do |element1|
	(class002).sort.each do |element2|
	(class003).sort.each do |element3|
	(class004).sort.each do |element3|
	(class012).sort.each do |element4|
			csv << [vhodno_nivo, class002, class003,class004,class012].flatten
			end
 		end
	end
end
end
end














