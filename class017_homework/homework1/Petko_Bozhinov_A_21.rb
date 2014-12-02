# Petko '3phase' Bozhinov
# JustCrew

# Not working

require 'open3'

# result file: result.*
Stefan_1 	= ["da3e5702", "db2c5549", "6933f104", "007ac6de", "4ba9968b", "d614ce69", "769ce879", "990d42f4", "7097778f", "fce4d375"]

# result file: results.*
Stefan_2 	= ["e68e2949", "600ed2d4", "8fc44197", "2899304a", "f74e194f", "27ed8788", "82e7bff5", "14d2c190", "2c40c53d", "a059b1d0", "e2d2e61b", "c79cebde"]

# result file: result_*_*_*.*
Rado_1 		= ["b128c3", "fd50e0", "bd4324", "02e338"]

# result file: result.*
Rado_2 		= ["6f8073", "755d84", "8a6e81"]
Stanislav 	= ["44e94fc4", "582de2e5", "6c3d2ca8", "7d2544d7", "bad8d1c2", "f33e8621", "46025b3d", "03c6ca26", "07c5163f", "f76433c1", "1a7b3031", "193e7097", "2bef4341", "ccaf7125", "209924b8"]
Moreti	 	= ["be4045", "5fcdeb", "ad735a", "5b868a", "fcb67d"]

def compare
	out = `ls -ld **/*result*`							# checks for filenames that contain "result"
	out = out.split('/').last.split(/\n/).first
	haha = `less #{out}`
	puts haha
	`rm -f #{out}`
end

def runner task, repo, name
	folder = task.split('/').last.split('_')
	folder = "#{folder[0]}#{folder[1]}"
	output = `ruby #{task} #{repo} #{repo}`
	if output == "" 
		compare# name
	end
end

Dir.glob("../../class017_test/files_for_exam_2/results/*_*_*_*.rb") do |file|
	if file.split("_").last.split(".rb").first != nil or file.split("_").last.split(".rb").first =~ /writer/
		hashCode = file.split("_").last.split(".rb").first
		Dir.glob("../../class017_test/files_for_exam_2/expects/#{hashCode}.*") do |res|
			if Stefan_1.include? hashCode or Stefan_2.include? hashCode
				path = "../../class016/Stefan_Iliev_B_28/fixture"
				name = "stefan"
			elsif Rado_1.include? hashCode
				path = "../../class016/Radoslav_Kostadinov_22_A/fixture"
				name = "rado1"
			elsif Rado_2.include? hashCode
				path = "../../class016/Radoslav_Kostadinov_22_A/fixture/"
				name = "rado2"
			elsif Stanislav.include? hashCode
				path = "../../class016/Stanislav_Iliev_26_B/fixture/"
				name = "stanislav"
			elsif Moreti.include? hashCode
				name = "moreti"
			end
			if path != nil and path != ""
				runner file, path, name
			end
		end
	end
end	
