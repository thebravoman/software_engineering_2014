# How to run: ruby /home/marian/Git/software_engeneering_2014/class017_test/files_for_exam_2/

require 'open3'
require './Marian_Belchev_17_html_writer.rb'

# result file: result.*
Stefan_1 	= ["da3e5702", "db2c5549", "6933f104", "007ac6de", "4ba9968b", "d614ce69", "769ce879", "990d42f4", "7097778f", "fce4d375"]
# result file: results.*
Stefan_2 	= ["e68e2949", "600ed2d4", "8fc44197", "2899304a", "f74e194f", "27ed8788", "82e7bff5", "14d2c190", "2c40c53d", "a059b1d0", "e2d2e61b", "c79cebde"]

# result file: result_*_*_*.*
Rado_1 		= ["b128c3", "fd50e0", "bd4324", "02e338"]
# result file: result.*
Rado_2 		= ["6f8073", "755d84", "8a6e81"]

Stanislav 	= ["267a81", "r279960a1", "44e94fc4", "582de2e5", "6c3d2ca8", "7d2544d7", "bad8d1c2", "f33e8621", "46025b3d", "03c6ca26", "07c5163f", "f76433c1", "1a7b3031", "193e7097", "2bef4341", "ccaf7125", "209924b8"]
Moreti 		= ["be4045", "5fcdeb", "ad735a", "5b868a", "fcb67d"]

@results = Hash.new

def rmResultFile
	resultFiles = ["results.*", "result.*", "results_*_*_*.*", "result_*_*_*.*"]

	resultFiles.each do |file|
		`rm -f #{file}`
	end
end

def runProgram fileName, fixtureDir
	stdin, stdout, stderr = Open3.popen3("ruby #{ARGV[0]}/results/#{fileName} #{fixtureDir} #{fixtureDir}")
	return programError = stderr.readlines.inject(:+).to_s
end

def openExpect taskHex
	stdin, stout, stderr = Open3.popen3("less #{ARGV[0]}/expects/#{taskHex}.*")
	stderr =~ "No such file or directory" ? expect = NIL : expect = stout.readlines.inject(:+).to_s
	return expect
end

def split fileName
	firstName = fileName.split('_').first
	lastName = fileName.split('_', 2).last.split('_').first
	return fullName = "#{firstName.capitalize} #{lastName.capitalize}"
end

def check fileName, programError, resultFileName, expect
	if programError.empty? && expect != NIL
		stdin, stout, stderr = Open3.popen3("less #{resultFileName}")
		result = stout.readlines.inject(:+).to_s
		result.eql? expect ? @results[split(fileName)] = 1 : @results[split(fileName)] = 0
	else
		@results[split(fileName)] = 0
	end
end

Dir.glob("#{ARGV[0]}results/*_*_*_*.rb") do |file|
	fileName = file.split("/").last
	taskHex = file.split("_").last.split(".").first

	unless fileName =~ /writer/ || fileName =~ /Writer/
		case taskHex
			when *Stefan_1, *Stefan_2
				run = runProgram(fileName, "/home/marian/Git/software_engineering_2014/class016/Stefan_Iliev_B_28/fixture/")
				Stefan_2.include? taskHex ? generatedResultFile = "result.*" : generatedResultFile = "results.*"
				check(fileName, run, generatedResultFile, openExpect(taskHex))
				rmResultFile

			when *Moreti
				run = runProgram(fileName, "/home/marian/Git/software_engineering_2014/class014_homework/")
				check(fileName, run, "results.*", openExpect(taskHex))
				rmResultFile

			when *Stanislav
				run = runProgram(fileName, "/home/marian/Git/software_engineering_2014/class016/Stanislav_Iliev_26_B/fixture/")
				check(fileName, run, "results.*", openExpect(taskHex))
				rmResultFile

			when *Rado_1, *Rado_2
				run = runProgram(fileName, "/home/marian/Git/software_engineering_2014/class016/Radoslav_Kostadinov_22_A/fixture/")
				Rado_2.include? taskHex ? generatedResultFile = "result_*_*_*.*" : generatedResultFile = "result.*"
				check(fileName, run, generatedResultFile, openExpect(taskHex))
				rmResultFile
		end
	end
end

writer = HTMLWriter.new
writer.write @results