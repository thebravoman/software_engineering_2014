def check1(results, path, comtime, clas)
	Dir.chdir(ARGV[0]+"#{path}") do |fixture|
		expected_file =flname+"_Class2_2.rb"
		if  File.exist?(expected_file)
			commit_time = `git log #{expected_file}`
			if (commit_time==(`#{comtime} #{expected_file}`))
				results[flname]["#{clas}"] = 2
			else
				results[flname]["#{clas}"] = 1
			end
			
		else	
			expected_file =flname+"_Class2_1.rb"
			if  File.exist?(expected_file)
				commit_time = `git log #{expected_file}`
				if (commit_time==(`#{comtime} #{expected_file}`))
					results[flname]["#{clas}"] = 2
				else
					results[flname]["#{clas}"] = 1
				end
			else
			results[flname]["#{clas}"] = 0
			end
		end	
	end
	
end
