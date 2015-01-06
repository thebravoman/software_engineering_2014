def check3(results, path, comtime, clas)
	direction = ""
	sizee = 0
	
	Dir.glob("#{path}").each do |fixture|
	
		filenamee = fixture.split('/').last
		beepname = filenamee.split("_")[0]+" "+filenamee.split("_")[1]
		if results[beepname] == nil
			results[beepname]=Hash.new
			results[beepname]["#{clas}"]=0
		end

		sizee = fixture.split('/').size
		sizee = sizee-2
		for i in 1..sizee
			direction = direction+"/"+fixture.split('/')[i]
		end
		###direction = direction+"/" #
		sizee = 0
		Dir.chdir("#{direction}") do |primerno| 
		direction = "" 
			
			commit_time =`git log #{filenamee}` 

			if (commit_time==(`#{comtime} #{filenamee}`)) 
				results[beepname]["#{clas}"] = 2
			else
				results[beepname]["#{clas}"] = 1 
			end
		end
	end
end
