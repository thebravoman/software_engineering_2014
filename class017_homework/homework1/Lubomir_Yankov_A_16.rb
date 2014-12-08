# README: you have to pass arguments only for the repo
# FOR EXAMPLE: ruby Lubomir_Yankov_A_16.rb /home/lubomir/Desktop/software_engineering_2014/

grades = Hash.new # Creating hash

#----------------------------------------------- HASHCODES ---------------------------------------------------------------------------#
denis = ["8083b646", "db2c5549", "20f8b3bf", "70f62633", "d7f99c35", "318bd0c9", "de9aae7f", "4196b719", "adc37608", "db748167", "3f0b3105", "cfc3fed5"]

vanya = ["5182303e", "8cdbeee3", "7a0cd1d9", "ba0be6d2", "277028c8", "16378d00", "46987230", "33b82143", "24357dae", "ade0bd72", "5341dcc6", "eefff8cc", "bf9b6038"]

martin = ["840cf8", "3ca383", "d353b5", "4dd932", "d3be84", "b12bee", "cd93ec"]

ivo 	= ["738835"]

qze = ["003f7cb7", "89460c12", "68a91571", "710716f5"]

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
Dir.glob(ARGV[0]+"class019_test/files_for_exam_2/results/*_*_*_*.rb").each do |script_file|
	
	program = script_file.split(".").first.split("_").last
	
	script_name = script_file.split("/").last
	
	names = script_file.split("/").last.reverse.split("_", 3).last.reverse.gsub("_"," ")

	unless script_name.include?("writer") || names.include?("Writer")
	
		grades[names] = 1
	
	end
	
	Dir.glob(ARGV[0]+"class019_test/files_for_exam_2/expects/*.*").each do |fixture|
		
		expected = fixture.split(".").first.split("/").last 
		
		if program == expected 
			
			next if script_name.include?("writer") || script_name.include?("Writer")
				
			if denis.include?"#{expected}" 
					
				arguments = ARGV[0] + "/class016/Denis_Stoinev_B_13/fixture/"

			end

			if vanya.include?"#{expected}" 
				
				arguments = ARGV[0] + "/class016/Vanya_Santeva_5_B/fixture/"
				
			end

			if martin.include?"#{expected}" 
				
				arguments = ARGV[0] + "/class016/Martin_Grigorov_23_B/fixture/"
				
			end

			if qze.include?"#{expected}" 
				
				arguments = ARGV[0] + "/class016/Lubomir_Yankov_16_A/fixtures/"
				
			end
			
			if ivo.include?"#{expected}" 
				
				arguments = ARGV[0] + "/class016/Ivo_Stratev_16_B/fixtures/"
				
			end
				
			system("ruby #{script_file} #{arguments}")
				
			success = $?.success? # returns true if the execute was successful
				
			# system("clear") # clearing console

			if success == true
					
				extension = fixture.split(".").last
					
				if File.exist?("result.#{extension}") 
					
					compare("result.#{extension}", fixture) # comparing output results to expected results
					
				elsif File.exist?("results.#{extension}")
					
					compare("results.#{extension}", fixture) # comparing output results to expected results
					
				elsif File.exist?("results_*_*_*_*.#{extension}")
					
					compare("results_*_*_*_*.#{extension}", fixture) # comparing output results to expected results
					
				elsif File.exist?("result_*_*_*.#{extension}")

					compare("result_*_*_*.#{extension}", fixture)

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
system("rm -f results_*_*_*_*.xml")
system("rm -f result_*_*_*.xml")
system("rm -f *.json")

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
