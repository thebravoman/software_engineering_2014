require 'similar_text'
data=Hash.new	#NAMES
data1=Hash.new	#PATHS
data2=Hash.new	#EXPECTED RESULTS
data3=Hash.new	#TASK
result_ex1=Hash.new #SELFEXPLANITORY
result_ex2=Hash.new	#SELFEXPLANITORY

#We use "a" and "b" as the variable while making a .each loop for the data hashes 

Dir.glob("/home/iluvanime/software_engineering_2014/class017_test/files_for_exam_2/*").each do |file|
	if file.split("/").last == "results" #results
		Dir.glob("#{file}/*").each do |file_results|
			file_result=file_results.split("/").last
			if (file_result.split("_").first == 'xml') || (file_result.split("_").first == 'html')
			else
				data1[file_result.split("_").last.chomp("\.rb")]=file_results
				data["#{file_result.split("_").first},#{file_result.split("_")[1]}"] = file_result.split("_").last.chomp("\.rb")
			end
		end
	elsif file.split("/").last == "tasks" #expects + tasks
		Dir.glob("/home/iluvanime/software_engineering_2014/class017_test/files_for_exam_2/expects/*").each do |file_results|
			file_hex=file_results.split("/").last.split(".").first
			data.each do |a|
				if a[1] == file_hex
					complete=""
					file = File.open(file_results, "r").each do |text|
						complete+=text
					end
					data2[file_hex]=complete #hex code = expected results
				end
			end
		end
		Dir.glob("/home/iluvanime/software_engineering_2014/class017_test/files_for_exam_2/tasks/*").each do |file_results|
			file_hex=file_results.split("/").last.split(".").first.split("_").last
			data.each do |a|
				if a[1] == file_hex
					complete=""
					file = File.open(file_results, "r").each do |text|
						complete+=text
					end
					data3[file_hex]=complete #NOOOOO PLZ DON"T MAKE UZ OPTIMIZE !_!
				end
			end
		end
	end
end
Dir.glob("/home/iluvanime/software_engineering_2014/class016/*").each do |file|
	Dir.glob("#{file}/*").each do |sub_file|
		sub_file=sub_file.split("/").last
		if sub_file=="fixture" || sub_file=="fixtures"
			Dir.glob("#{file}/*").each do |file_sub| #output = `ruby #{script_file} #{fixture}`
				file_extention_check = file_sub.split(".").last
				if file_extention_check == "eruby"
					complete=""
					files = File.open(file_sub, "r").each do |text|
						complete+=text
					end
					data3.each do |a|
						e = a[1].similar("#{complete}")
						if e > 80
							data1.each do |b|
								if b[0]==a[0]
									output = `ruby #{b[1]} #{file}/#{sub_file}`
									Dir.glob("*").each do |checking_for_results|
										if checking_for_results.split(".").first == "results"
											file = `pwd`
											file = file.delete "\n"
											complete=""
											files = File.open("#{file}/#{checking_for_results}", "r").each do |text|
												complete+=text
											end
											data2.each do |c|
												if c[0]==b[0]
													puts "D"				
													data.each do |d|
														if d[1]==c[0]
															puts d[0]
															result_ex2[d[0]] = 1 #GIVE THIS PERSON A KIUFTE HE GOT A 1
														else
															result_ex2[d[0]] = 0
														end
													end
													puts "E"
												end
											end
											puts `rm "#{file}/#{checking_for_results}"`
										end
									end 
								end
							end
						end
					end
				end
			end
		end
	end
end



puts "\n\n\nEND"
puts `clear`
result_ex2.each do |a|
	puts a
end
