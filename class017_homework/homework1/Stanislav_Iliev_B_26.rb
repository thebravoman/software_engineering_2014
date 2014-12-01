dir = ARGV[0]
dir = dir[0..-2] if dir[-1] == "/"

def write_to_HTML(result)
	File.open("results_Stanislav_Iliev_B_26.html","w") do |file|
		file.puts "<html>"
		file.puts "<head></head>"
		file.puts "<body>"
		file.puts "<table border=\"1\">"
		result.each do |key, value|
			key_split = key.split(" ")
			file.puts "\t\t<td>#{key_split[0]}<td>"
			file.puts "\t\t<td>#{key_split[1]}<td>"
			file.print "\t\t<td>"
			file.print value
			file.puts "</td>"
			file.puts "\t</tr>"
		end
		file.puts "</table>"
		file.puts "</body>"
		file.puts "</html>"
	end
end

fixture_hash = Hash.new
file = File.open("#{dir}/class017_homework/hash_to_fixture.csv")
file.readlines.each do |line|
	if line.include? "class"
		fixture = line.split(",").first
		hashes = line.gsub(fixture, "").split(",")
		hashes.each do |hex|
			hex.gsub("\n","")
			fixture_hash[hex] = fixture
		end
	end
end

results = Hash.new
expected_hash = Hash.new
exp_file = File.open("#{dir}/class017_homework/result_output_name.csv")
exp_file.readlines.each do |line|
	expected_hash[line.split(",").first] = line.split(",").last.gsub "\n",""
end

Dir.glob("#{dir}/class017_test/files_for_exam_2/**/*.*").each do |script_file|
	filename = script_file.split("/").last
	if script_file.include? "/results/" and filename.count("_") == 3
		first_name = script_file.split(/\//).last.split("_").first.capitalize
		last_name = script_file.split(/\//).last.split("_",2).last.split("_").first.capitalize
		name = "#{first_name} #{last_name}"
		current_hex = script_file.split("_").last.gsub ".rb",""
		fixture_hash.each do |hex,fixture|
			if current_hex == hex
				`ruby #{script_file} #{dir+fixture}*`
			end
		end

		expected_hash.each do |hex,expected_name|
			if current_hex == hex
				if File.file?("#{expected_name}") == false
					results[name] = 0
					next
				end
				generated_file = File.open("#{expected_name}")
				extension = '.' + expected_hash[current_hex].split(".").last

				if File.file?("#{dir}/class017_test/files_for_exam_2/expects/#{current_hex}#{extension}") == false
					results[name] = "?"
					next
				end
				expected_file = File.open("#{dir}/class017_test/files_for_exam_2/expects/#{current_hex}#{extension}")

				if generated_file.readlines == expected_file.readlines
					results[name] = 1
				else
					results[name] = 0
				end
			end
		end
	end
end

write_to_HTML(results.sort)
