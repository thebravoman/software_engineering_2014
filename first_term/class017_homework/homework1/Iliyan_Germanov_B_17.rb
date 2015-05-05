require_relative "Iliyan_Germanov/argument_searcher.rb"
require_relative "Iliyan_Germanov/expected_searcher.rb"
require_relative "Iliyan_Germanov/html_writer.rb"

results = Hash.new
repoPath = ARGV[0]
Dir.chdir("#{repoPath}") do
	repoPath = Dir.pwd
end

args = ArgumentSearcher.new.get(repoPath)
expected = ExpectedSearcher.new.find(repoPath)
extensions = ["csv", "json", "xml", "html", "txt"]

#puts args["3ca383"]
#puts expected["3ca383"]
#abort("")
#Hard coding specific cases:
args["ade0bd72"] = "#{repoPath}/class016/Veselin_Dechev_2_A/fixture/"
args["bf9b6038"] = "#{repoPath}/class016/Veselin_Dechev_2_A/fixture/"


def clear_results(repoPath, extensions)
	extensions.each do |ext|
		Dir.glob("#{repoPath}/class019_test/files_for_exam_2/results/*.#{ext}") do |path|
			`rm #{path}`
		end
	end
end

def get_output(repoPath, extensions)
	extensions.each do |ext|
		Dir.glob("#{repoPath}/class019_test/files_for_exam_2/results/*.#{ext}") do |path|
			return File.read(path)
		end
	end
	return "Ouput file not found!"
end

Dir.chdir("#{repoPath}/class019_test/files_for_exam_2/results") do
	Dir.glob("#{repoPath}/class019_test/files_for_exam_2/results/*.rb") do |script|
		filename = script.split("/").last
		next if filename.count("_") != 3 or filename.include? "writer"
		hashcode = filename.split("_").last.split(".").first
		student = filename.split("_").first + "_" + filename.split("_")[1]
		clear_results(repoPath, extensions)
		`ruby #{script} #{args[hashcode]}`
		script_output = get_output(repoPath, extensions)
		if expected[hashcode] == nil
			expected[hashcode] = "EXPECTED NOT FOUND!" 
			results[student] = "EXPECTED NOT FOUND!"
			next
		end
		if script_output.delete("\n\t ") == expected[hashcode].delete("\n\t ")
			results[student] = 1
		else
			results[student] = 0
		end
	end
end

writer = HTMLWriter.new
writer.write(results)
