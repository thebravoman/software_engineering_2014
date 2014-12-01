require_relative "Kristina_Pironkova_html_writer.rb"
repo = ARGV[0]
results = Hash.new
stefan 	= ["c79cebde", "da3e5702", "e2d2e61b", "db2c5549", "6933f104", "a059b1d0", "2c40c53d", "14d2c190", "007ac6de", "82e7bff5", "4ba9968b", "27ed8788", "f74e194f", "2899304a", "d614ce69", "8fc44197", "769ce879", "990d42f4", "7097778f", "fce4d375", "600ed2d4", "e68e2949"]
vanya	= ["44e94fc4", "582de2e5", "6c3d2ca8", "7d2544d7", "bad8d1c2", "f33e8621", "46025b3d", "03c6ca26", "07c5163f", "f76433c1", "1a7b3031", "193e7097", "2bef4341", "ccaf7125", "209924b8"]
rado 	= ["b128c3", "6f8073", "fd50e0", "bd4324", "02e338","6f8073", "755d84", "8a6e81"]
moreti 	= ["be4045", "5fcdeb", "ad735a", "5b868a", "fcb67d"]

def check result, fixture
	File.open("#{result}", "r") do |f1|
		File.open("#{fixture}", "r") do |f2|
			while line = f1.gets && line1 = f2.gets
				line  = line.to_s.delete  "\n"
				line1 = line1.to_s.delete "\n"
				unless "#{line}".casecmp "#{line1}"
					results[names] = 0
				end
			end
		end
	end
end

def export_to_html result
	writer = HTMLWriter.new
	writer.write result
end

def argument_set hex_code_expect, repo, stefan, vanya, rado, moreti
	if stefan.include?"#{hex_code_expect}" 
		argument = repo + "class016/Stefan_Iliev_B_28/fixture/"
	elsif vanya.include?"#{hex_code_expect}" 
		argument = repo + "class016/Vanya_Santeva_5_B/fixture/"
	elsif rado.include?"#{hex_code_expect}" 
		argument = repo + "class016/Radoslav_Kostadinov_22_A/fixture/"
	elsif moreti.include?"#{hex_code_expect}" 
		argument = repo + "class014_homework/"
	end
end

Dir.glob(repo + "class017_test/files_for_exam_2/results/*.rb").each do |file| 
	if !(file.include? "writer" or file.include? "Writer" or file.include? "xmlWriter")
		program_name = file.split("/").last
		first_name = program_name.split("_").first
		last_name = program_name.split("_")[1]
		hex_code = program_name.split("_")[3].split(".").first
		full_name = first_name + " " + last_name
		results[full_name] = 1 if full_name != nil
	end

	Dir.glob(repo + "class017_test/files_for_exam_2/expects/*").each do  |fixtures|  
	 	hex_code_expect = fixtures.split("/").last.split(".").first.split("_").last
		argument_set hex_code_expect, repo,stefan, vanya, rado, moreti

			`ruby #{file} {argument}`
			success = $?.success?
			if success == true
					ex = fixtures.split(".").last
				if File.exist?("result.#{ex}") 
					check "result.#{ex}", fixtures
				elsif File.exist?("results.#{ex}")
					check "results.#{ex}", fixtures
				elsif File.exist?("results.#{ex}")
					check "results_*_*_*_*.#{ex}", fixtures
				end
			else results[full_name] = 0
			end
		
	end
end

export_to_html results


