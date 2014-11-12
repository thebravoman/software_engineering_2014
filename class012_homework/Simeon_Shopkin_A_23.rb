require 'csv'
firstname = Array.new
results = Hash.new
file_count=0
CSV.foreach(ARGV[0]+"/students_list2.csv") do |name|
	#firstname[]=name[0]
	vh=name[0]+name[1] 
	flname=name[0]+"_"+name[1] 
	results[flname] = Hash.new
	results[flname]["VH"] = 0
	Dir.glob(ARGV[0]+"/vhodno_nivo/**/") do |content|
		if File.directory?(content)
			Dir.glob(content+"/*.*").each do |name|
				file_count += 1
			end
			if file_count >= 3
				content = content.split('/').last.split('_')
				if content.size>1
					content = content[0]+content[1]
					if vh==content
						commit_time = `git log #{content}`
						if (commit_time==(`git log --until=Sep--17--2014--20:00:00 #{content}`))
							results[flname]["VH"] = 2
						else
							results[flname]["VH"] = 1
						end
					end
				end
			end
			file_count=0
		end
	end
	i=0
	Dir.glob(ARGV[0]+"/vhodno_nivo/*.*") do |content|
		cheker=content.split("/").last.split("_")
		if cheker.size >1
			a=cheker[0]+cheker[1]
			Dir.glob(ARGV[0]+"/vhodno_nivo/*.*") do |content1|
				cheker1=content1.split("/").last.split("_")
				if cheker1.size>1
					b=cheker1[0]+cheker1[1]
					if b==a
						i+=1

					end
					if i>=3
						
						if vh==b
							commit_time = `git log #{content}`
							if (commit_time==(`git log --until=Sep--17--2014--20:00:00 #{content}`))
								results[flname]["VH"] = 2
							else
							results[flname]["VH"] = 1
							end
						end
					end
				end
			end
		i=0
		end
	end
	Dir.chdir(ARGV[0]+"/class002_homework/") do |fixture|
		expected_file =flname+"_Class2_2.rb"
		if  File.exist?(expected_file)
			commit_time = `git log #{expected_file}`
			if (commit_time==(`git log --until=Sep--22--2014--20:00:00 #{expected_file}`))
				results[flname]["class_002"] = 2
			else
				results[flname]["class_002"] = 1
			end
			
		else	
			expected_file =flname+"_Class2_1.rb"
			if  File.exist?(expected_file)
				commit_time = `git log #{expected_file}`
				if (commit_time==(`git log --until=Sep--22--2014--20:00:00 #{expected_file}`))
					results[flname]["class_002"] = 2
				else
					results[flname]["class_002"] = 1
				end
			else
			results[flname]["class_002"] = 0
			end
		end	
	end
	Dir.chdir(ARGV[0]+"/class003_homework/") do |fixture|
		expected_file =flname+"_Class3_2.rb"
		if  File.exist?(expected_file)
			commit_time = `git log #{expected_file}`
			if (commit_time==(`git log --until=Sep--24--2014--20:00:00 #{expected_file}`))
				results[flname]["class_003"] = 2
			else
				results[flname]["class_003"] = 1
			end
			
		else	
			expected_file =flname+"_Class3_1.rb"
			if  File.exist?(expected_file)
				commit_time = `git log #{expected_file}`
				if (commit_time==(`git log --until=Sep--24--2014--20:00:00 #{expected_file}`))
					results[flname]["class_003"] = 2
				else
					results[flname]["class_003"] = 1
				end				
			end
			results[flname]["class_003"] = 0
		end	
	end
	Dir.chdir(ARGV[0]+"/class004_homework/") do |fixture|
		if  File.exist?(flname)
			commit_time = `git log #{flname}`
			if (commit_time==(`git log --until=Sep--29--2014--20:00:00 #{flname}`))
				results[flname]["class_004"] = 2
			else
				results[flname]["class_004"] = 1
			end
			
		else	
			results[flname]["class_004"] = 0
		end	
	end
	Dir.chdir(ARGV[0]+"/class009_homework/") do |fixture|
		expected_file =name[4]
		if  File.exist?(expected_file)
			commit_time = `git log #{expected_file}`
			if (commit_time==(`git log --until=Oct--27--2014--20:00:00 #{expected_file}`))
				results[flname]["class_009"] = 2
			else
				results[flname]["class_009"] = 1
			end
			
		else	
			expected_file =expected_file+".pdf"
			if  File.exist?(expected_file)
				commit_time = `git log #{expected_file}`
				if (commit_time==(`git log --until=Oct--27--2014--20:00:00 #{expected_file}`))
					results[flname]["class_009"] = 2
				else
					results[flname]["class_009"] = 1
				end				
			else
				results[flname]["class_009"] = 0
			end
		end	
	end
	Dir.chdir(ARGV[0]+"/class012_homework/") do |fixture|
		expected_file =flname+"_"+name[2]+"_"+name[3]+".rb"
		if  File.exist?(expected_file)
			commit_time = `git log #{expected_file}`
			if (commit_time==(`git log --until=Nov--24--2014--20:00:00 #{expected_file}`))
				results[flname]["class_012"] = 2
			else
				results[flname]["class_012"] = 1
			end
			
		else	
			results[flname]["class_012"] = 0
		end	
	end
	
	



end
CSV.open("results_Simeon_Shopkin_A_23.csv","w") do |csv|
	csv << ["Sudent/Homework", results.first.last.keys].flatten
	results.keys.each do |key|
		csv << [key,results[key].values].flatten
	end
end
