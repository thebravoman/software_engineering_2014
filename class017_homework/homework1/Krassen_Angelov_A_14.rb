#ruby Krassen_Angelov_A_14.rb /home/path_to/software_engineering_2014/

results = Hash.new

stefan = ["c79cebde", "da3e5702", "e2d2e61b", "db2c5549", "6933f104", "a059b1d0", "2c40c53d", "14d2c190", "007ac6de", "82e7bff5", "4ba9968b", "27ed8788", "f74e194f", "2899304a", "d614ce69", "8fc44197", "769ce879", "990d42f4", "7097778f", "fce4d375", "600ed2d4", "e68e2949"]
vanq = ["44e94fc4", "582de2e5", "6c3d2ca8", "7d2544d7", "bad8d1c2", "f33e8621", "46025b3d", "03c6ca26", "07c5163f", "f76433c1", "1a7b3031", "193e7097", "2bef4341", "ccaf7125", "209924b8"]
radoslav = ["b128c3", "6f8073", "fd50e0", "755d84", "8a6e81", "bd4324", "02e338"]
moreti = ["be4045", "5fcdeb", "ad735a", "5b868a", "fcb67d"]

def rnl string
	string.to_s.delete "\n"
end

def compare result, expected
	File.open("#{result}", "r") do |file1|
		File.open("#{expected}", "r") do |filr2|
			while line1 = file1.gets and line2 = file2.gets
				line1 = rnl line1
				line2 = rnl line2
				if !"#{line1}".casecmp "#{line2}"
					results["#{full_name[0]}" + " " + "#{full_name[1]}"] = 0
				end
			end
		end
	end
end

Dir.glob(ARGV[0] + "class017_test/files_for_exam_2/results/*_*_*_*.rb").each do |script_file|
	script = script_file.split("/").last
	short_script = script.split("/").last.split(".").first
	full_name = short_script.split("_")
	
	next if full_name.include? "writer" or full_name.include? "Writer"
	
	results["#{full_name[0]}" + " " + "#{full_name[1]}"] = 1
	
	Dir.glob(ARGV[0] + "class017_test/files_for_exam_2/expects/*").each do |expected|
		short_expected = expected.split("/").last.split(".").first
		
		if full_name[3] == short_expected 
			if stefan.include? "#{full_name[3]}" 
				fixture = ARGV[0] + "class016/Stefan_Iliev_B_28/fixture"
			elsif vanq.include? "#{full_name[3]}" 
				fixture = ARGV[0] + "class016/Vanya_Santeva_5_B/fixture/"
			elsif radoslav.include? "#{full_name[3]}" 
				fixture = ARGV[0] + "class016/Radoslav_Kostadinov_22_A/fixture"
			elsif moreti.include? "#{full_name[3]}" 
				fixture = ARGV[0] + "class014_homework/"
			end
			
			`ruby #{script_file} #{fixture}`
			success = $?.success?
			if success == true
				extension = fixture.split(".").last
				if File.exist? "result.#{extension}"
					compare "result.#{extension}", expected
				elsif File.exist? "results.#{extension}"
					compare "results.#{ext}", expected
				elsif File.exist? "results.#{extension}"
					compare "results_*_*_*_*.#{extension}", expected
				elsif File.exist? "result.#{extension}"
					compare "result_*_*_*.#{extension}", expected
				end
			else 
				results["#{full_name[0]}" + " " + "#{full_name[1]}"] = 0
			end
		end	
	end
end

system("rm -f result.*")
system("rm -f results.*")
system("rm -f results_*_*_*_*.xml")
system("rm -f result_*_*_*.xml")

html = File.open("results_Krassen_Angelov_A_14.html", "w")
	html.puts("<!DOCTYPE html>")
	html.puts("<html>")
		html.puts("<head>")
			html.puts("<title>Exam Results</title>")
		html.puts("</head>")
		html.puts("<body>")
			html.puts("<table border=1 align=left>")
				html.puts("<tr>")		
					html.puts("<th>FirstName</th>")
					html.puts("<th>LastName</th>")
					html.puts("<th>Result</th>")
				html.puts("</tr>")
			results.sort.each do |full_name, mark|
				first_name = full_name.split(" ").first
				last_name = full_name.split(" ").last
				html.puts("<tr>")
					html.puts("<th>#{first_name}</th>")
					html.puts("<th>#{last_name}</th>")
					html.puts("<th>#{mark}</th>")
				html.puts("</tr>")
			end			
			html.puts("</table>")
		html.puts("</body>")
	html.puts("</html>")
html.close
