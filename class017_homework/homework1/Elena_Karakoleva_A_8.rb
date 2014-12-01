# Run: ruby Elena_Karakoleva_A_8.rb /home/elena/Desktop/software_engineering_2014/class017_test/files_for_exam_2/results/ /home/kamena/Desktop/software_engineering_2014/class017_test/files_for_exam_2/expects/


require 'csv'
require 'nokogiri'
require './Elena_Karakoleva_html_writer.rb'

def remove_new_lines string
	string.to_s.delete "\n"
end

def check resultFileName, fixture
	File.open("#{resultFileName}", "r") do |f1|
		File.open("#{fixture}", "r") do |f2|
			while line = f1.gets && line1 = f2.gets
				line = remove_new_lines line
				line1 = remove_new_lines line1
				unless "#{line}".casecmp "#{line1}"
					results[names] = 0
				end
			end
		end
	end
end
results = Hash.new()
stefan 	= ["c79cebde", "da3e5702", "e2d2e61b", "db2c5549", "6933f104", "a059b1d0", "2c40c53d", "14d2c190", "007ac6de", "82e7bff5", "4ba9968b", "27ed8788", "f74e194f", "2899304a", "d614ce69", "8fc44197", "769ce879", "990d42f4", "7097778f", "fce4d375", "600ed2d4", "e68e2949"]
vanya	= ["44e94fc4", "582de2e5", "6c3d2ca8", "7d2544d7", "bad8d1c2", "f33e8621", "46025b3d", "03c6ca26", "07c5163f", "f76433c1", "1a7b3031", "193e7097", "2bef4341", "ccaf7125", "209924b8"]
rado 	= ["b128c3", "6f8073", "fd50e0", "755d84", "8a6e81", "bd4324", "02e338"]
moreti 	= ["be4045", "5fcdeb", "ad735a", "5b868a", "fcb67d"]

Dir.glob(ARGV[0]+"*_*_*_*.rb").each do |script_file|
	program = script_file.split(".").first.split("_").last
	prog_name = script_file.split("/").last
	names = script_file.split("/").last.reverse.split("_", 3).last.reverse.gsub("_"," ")
	unless prog_name.include?("writer") || names.include?("Writer")
		results[names] = 1
	end
	Dir.glob(ARGV[1]+"*").each do |fixture|
		expected = fixture.split(".").first.split("/").last 
		if program == expected 
			unless prog_name.include?("writer") || prog_name.include?("Writer")
				if stefan.include?"#{expected}" 
					argv = script_file.reverse.split("/", 5).last.reverse + "/class016/Stefan_Iliev_B_28/fixture"
				elsif vanya.include?"#{expected}" 
					argv = script_file.reverse.split("/", 5).last.reverse + "/class016/Vanya_Santeva_5_B/fixture/"
				elsif rado.include?"#{expected}" 
					argv = script_file.reverse.split("/", 5).last.reverse + "/class016/Radoslav_Kostadinov_22_A/fixture"
				elsif moreti.include?"#{expected}" 
					argv = script_file.reverse.split("/", 5).last.reverse + "/class014_homework/"
				end
				`ruby #{script_file} {argv}`
				success = $?.success?
				if success == true
					ex = fixture.split(".").last
					if File.exist?("result.#{ex}") 
						check "result.#{ex}", fixture
					elsif File.exist?("results.#{ex}")
						check "results.#{ex}", fixture
					elsif File.exist?("results.#{ex}")
						check "results_*_*_*_*.#{ex}", fixture
					end
				else results[names] = 0
				end
			end
		break
		end
	end
end

writer = HTMLWriter.new
writer.write results
