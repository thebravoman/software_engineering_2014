dir = ARGV[0]

def write_to_HTML(result)
	File.open("results_Hristiyan_Velyakov_A_28.html","w") do |file|
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

results = Hash.new

Dir.glob("#{dir}/class017_test/files_for_exam_2/**/*.*").each do |script_file|
	filename = script_file.split("/").last
	if script_file.include? "/results/" and filename.count("_") == 3
		first_name = script_file.split(/\//).last.split("_").first.capitalize
		last_name = script_file.split(/\//).last.split("_",2).last.split("_").first.capitalize
		name = "#{first_name} #{last_name}"
		results[name] = (rand() * 2).to_i
	end
end

write_to_HTML(results.sort)
