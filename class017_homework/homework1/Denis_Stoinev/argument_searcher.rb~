require "yaml"

class ArgumentSearcher
	def get(repoPath)
		test_to_arg = YAML.load_file("./Iliyan_Germanov/config.yml")
		args = Hash.new
		Dir.glob("#{repoPath}/class019_test/files_for_exam_2/tests/*.txt") do |path|
			test = File.read(path).tr("\n", "")
			hashcode = path.split("/").last.split(".").first.split("_")[1]
			test_to_arg.keys.each do |key|
				if test.include?(key)
					args[hashcode] = test_to_arg[key].gsub("@@", "#{repoPath}")
				end
			end
		end
		return args
	end
end
