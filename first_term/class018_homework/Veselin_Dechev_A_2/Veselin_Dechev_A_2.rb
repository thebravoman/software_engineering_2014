require 'csv'
@results=Hash.new{|hash, key| hash[key] = []}	
@flog_flay=Hash.new{|key,value| key[value]=[]}
start=Time.now
def homework (location,time,index,otherindex) 
	Dir.glob("#{ARGV[0]}""#{location}""/*.*") do |script_file|
		#puts script_file
		first_name=script_file.split("/").last.split(".").first.split("_")[0]
		last_name=script_file.split("/").last.split(".").first.split("_")[1]
		fullname="#{first_name}" + " " + "#{last_name}"
	  	commit = `git log #{script_file}`
		if (commit==(`git log --until=#{time} #{script_file}`))
			score=2
	        elsif
			 (commit!=(`git log --until=#{time} #{script_file}`))
	 		score=1
			
		else	 		
			score=0						
	   	
		end
		flog = `flog #{script_file}`
		flog=flog.split(":").first
		@results["#{fullname}"][index] = score
	  	@flog_flay["#{fullname}"][otherindex] = flog
		
		end
	
		@results.keys.each do |key|
 		for i in 0..4
 		if @results["#{key}"][i] == nil
 		@results["#{key}"][i] = "0"
			
			end
 		end
	end
end
homework "class002_homework/","Sep--22--2014--20:00:00",0,0
homework "class003_homework/","Sep--24--2014--20:00:00",1,1
homework "class004/","Sep--29--2014--20:00:00",2,2
homework "class012_homework/","Nov--10--2014--20:00:00",3,3
homework "class014_homework/","Nov--13--2014--20:00:00",4,4
homework "class015_homework/","Nov--20--2014--06:00:00",5,5
#puts @results
#puts @flog_flay
	CSV.open("Veselin_Dechev_A_2.csv", "w") do |csv|
		@results.keys.each do |element1|
		csv << [element1,@results["#{element1}"]].flatten
	 	end
	@flog_flay.keys.each do |element2|
		csv << [element2,@flog_flay["#{element2}"]].flatten
		
	end
end	
puts Time.now-start
		
			
