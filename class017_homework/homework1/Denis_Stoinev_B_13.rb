#To run the script type `ruby Denis_Stoinev_B_13.rb path_to_the_repository`
require_relative "Denis_Stoinev_B_13/html_writer.rb"
repoPath = ARGV[0]
results = Hash.new

def evaluate(repoPath, path, hashcode)
expected = File.read("#{repoPath}/class017_test/files_for_exam_2/expects/#{hashcode}.txt").gsub(/\n\t /, "")
	if File.read(path).gsub(/\n\t /, "") == expected
		return 1
	else 
		return 0
	end
end

def run_script(repoPath, script, args)
	return `ruby #{repoPath}/class017_test/files_for_exam_2/results/#{script} #{repoPath}/#{args}`
end

args_to_scripts = Hash.new
argsCsv = File.read("#{repoPath}/class017_homework/homework1/Denis_Stoinev_B_13/hard_code.csv")
argsCsv.split("\n").each do |line|
	arg = line.split(",").first
	scripts = line.split(",")[1]
	args_to_scripts[arg] = scripts.split(" ")
end

`mkdir Results_temp` if not File.directory?("Results_temp")

if repoPath.start_with?("../")
	repoPath = "../" + repoPath
end

flag = 0
Dir.chdir("./Results_temp") do
	args_to_scripts.keys.each do |args|
		args_to_scripts[args].each do |script|
			if args.include?("task3") and flag == 0
				args = args.split(" ").first + " #{repoPath}" + args.split(" ").last
				flag = 1
			end
			hashcode = script.split("_")[3].split(".").first
			student_name = script.split("_").first + "_" + script.split("_")[1]
			if not File.exists?("#{repoPath}/class017_test/files_for_exam_2/expects/#{hashcode}.txt") 
				results[student_name] = "ENF"				
				next
			end
			`rm *` if not Dir["./Results_temp/*"].empty?
		 	run_script(repoPath, script, args)
			Dir.glob("./*.*") do |path|
				results[student_name] = evaluate(repoPath, path, hashcode)
			end
		end
	end
end

writer = HTMLWriter.new
writer.write(results)
`rm -rf Results_temp`
