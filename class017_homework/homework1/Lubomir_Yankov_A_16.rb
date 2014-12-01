# README: you have to pass arguments only for the repo
# FOR EXAMPLE: ruby Lubomir_Yankov_A_16.rb /home/lubomir/Desktop/software_engineering_2014/

grades = Hash.new # Creating hash

#----------------------------------------------- HASHCODES ---------------------------------------------------------------------------#
stefchu = ["c79cebde", "da3e5702", "e2d2e61b", "db2c5549", "6933f104", "a059b1d0", "2c40c53d", "14d2c190", "007ac6de", "82e7bff5", "4ba9968b", 
		   "27ed8788", "f74e194f", "2899304a", "d614ce69", "8fc44197", "769ce879", "990d42f4", "7097778f", "fce4d375", "600ed2d4", "e68e2949"]

vanya = ["44e94fc4", "582de2e5", "6c3d2ca8", "7d2544d7", "bad8d1c2", "f33e8621", "46025b3d", "03c6ca26", "07c5163f", "f76433c1", "1a7b3031", "193e7097", "2bef4341", "ccaf7125", "209924b8"]

radoslavchu = ["b128c3", "6f8073", "fd50e0", "755d84", "8a6e81", "bd4324", "02e338"]

moreti 	= ["be4045", "5fcdeb", "ad735a", "5b868a", "fcb67d"]

#-------------------------------------------------- METHODS ---------------------------------------------------------------------------------#
def rnl(string)
	string.to_s.delete "\n"
end

def compare(produced_file, fixture)

	text1 = File.read("#{produced_file}") # transferring file to string 
	text2 = File.read("#{fixture}") # transferring file to string

	text1 = rnl(text1) # removing new lines
	text2 = rnl(text2) # removing new lines

	if !text1.casecmp text2

		grades[names] = 0

	end

end


#---------------------------------------------------------- PARSING DIRCTORIES-----------------------------------------------------------------#
Dir.glob(ARGV[0]+"class017_test/files_for_exam_2/results/*_*_*_*.rb").each do |script_file|
	
	program = script_file.split(".").first.split("_").last
	
	script_name = script_file.split("/").last
	
	names = script_file.split("/").last.reverse.split("_", 3).last.reverse.gsub("_"," ")

	unless script_name.include?("writer") || names.include?("Writer")
	
		grades[names] = 1
	
	end
	
	Dir.glob(ARGV[0]+"class017_test/files_for_exam_2/expects/*.*").each do |fixture|
		
		expected = fixture.split(".").first.split("/").last 
		
		if program == expected 
			
			next if script_name.include?("writer") || script_name.include?("Writer")
				
			if stefchu.include?"#{expected}" 
					
				arguments = ARGV[0] + "/class016/Stefan_Iliev_B_28/fixture/"

			end

			if vanya.include?"#{expected}" 
				
				arguments = ARGV[0] + "/class016/Vanya_Santeva_5_B/fixture/"
				
			end

			if radoslavchu.include?"#{expected}" 
				
				arguments = ARGV[0] + "/class016/Radoslav_Kostadinov_22_A/fixture/"
				
			end

			if moreti.include?"#{expected}" 
				
				arguments = ARGV[0] + "/class014_homework/"
				
			end
				
			system("ruby #{script_file} {arguments}")
				
			success = $?.success? # returns true if the execute was successful
				
			system("clear") # clearing console

			if success == true
					
				extension = fixture.split(".").last
					
				if File.exist?("result.#{extension}") 
					
					compare("result.#{extension}", fixture) # comparing output results to expected results
					
				elsif File.exist?("results.#{extension}")
					
					compare("results.#{extension}", fixture) # comparing output results to expected results
					
				elsif File.exist?("results.#{extension}")
					
					compare("results*_*_*_*.#{extension}", fixture) # comparing output results to expected results
					
				end
				
			else 
					
				grades[names] = 0
				
			end
		
		end
	
	end
	
end

#-------------------------------------------------- CLEARING THE PRODUCED FILES ---------------------------------------------------#
system("rm -f result.*")
system("rm -f results.*")
system("rm -f results*_*_*_*.xml")
system("rm -f result*_*_*_*.xml")

#-------------------------------------------------- PRODUCING HTML FILE WITH RESULTS --------------------------------------------------#
html = File.open("results_Lubomir_Yankov_A_16.html", "w")
	
	html.puts("<!DOCTYPE html>")
	html.puts("<html>")
	html.puts("<head>")
	html.puts("<pre><title>Test results</title></pre>")
	html.puts("</head>")
	html.puts("<body>")
	html.puts("<table border=3 style=width:30% align=left>")
	html.puts("<tr>")		
	html.puts("<th>FirstName</th>")
	html.puts("<th>LastName</th>")
	html.puts("<th>Result</th>")
	html.puts("</tr>")
	
	grades.sort.each do |key, value|
		
		first_name = key.split(" ").first
		last_name = key.split(" ").last
		
		html.puts("<tr>")
		html.puts("<th>#{key.split(" ")[0]}</th>")
		html.puts("<th>#{key.split(" ")[1]}</th>")
		
		if value.to_i == 1
			
			html.puts("<th bgcolor=\"#00FF00\">#{value}</th>")
		
		else
			
			html.puts("<th bgcolor=\"red\">#{value}</th>")
		
		end
		
		html.puts("</tr>")
	
	end
					
	html.puts("</table>")
	html.puts("</body>")
	html.puts("</html>")

html.close