require_relative "Stefan_Iliev/fixture_searcher.rb"
require_relative "Stefan_Iliev/expected_searcher.rb"
require_relative "Stefan_Iliev/results_writer.rb"
require 'timeout'

#GNU POWERED.

repository_path = ARGV.shift || "."

test_results = Hash.new 
test_results.compare_by_identity

Dir.glob(repository_path + "/class017_test/files_for_exam_*/results/**/*_*_*_*.rb").each do |file|

	full_file_name = file.split("/").last
	next if full_file_name.split("_").length > 4 

	file_name = full_file_name.split(".").first
	program_hash = file_name.split("_").last
	next if program_hash.length < 5
	
	puts "Current Program:" + file_name + "\n\n"
	
	path_to_fixture = FixtureSearcher.find_with_hash(program_hash,repository_path).to_s 
	expected = ExpectedSearcher.read_with_hash(program_hash,repository_path).to_s
	result_extension = ExpectedSearcher.get_last_extension
	
	if file.include?("files_for_exam_1")
		path_to_fixture = "#{repository_path}/class008_test/visible/fixture1 #{repository_path}/class008_test/visible/fixture2"
	end 
	
	if path_to_fixture == "FNF" 
		test_results[file_name] = "FNF"
		next
	end 
	if expected == "ENF"
		test_results[file_name] = "ENF"
		next 
	end
	
	begin 
	status = Timeout::timeout(3) {
		unless system("ruby #{file} #{path_to_fixture}")
			puts "\n\n========ERROR======ERROR=======ERROR=====\n\n"
		end 
	}
	rescue Timeout::Error
		puts "Program timed out.\n\n"
	end 
	
	path_to_results =  "./result."+result_extension
	if File.exists?(path_to_results) && File.read(path_to_results) == expected
		test_results[file_name] = 1
	else 
		test_results[file_name] = 0
	end
end

ResultsWriter.write(test_results)