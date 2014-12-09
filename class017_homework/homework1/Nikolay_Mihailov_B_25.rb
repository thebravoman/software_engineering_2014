require 'yaml'
hash = Hash.new
def write(hash)
	html = File.open("results_Nikolay_Mihailov_B_25.html", "w")
	
	html.puts("<!DOCTYPE html>")
	html.puts("<html>")
	html.puts("	<table border=\"1\" style=\"width:50%\">")

	html.puts("	<tr>")
	html.puts("	<th> Name </th>")
	html.puts("	<th> Result </th>")
	html.puts("	</tr>")
	
	hash.keys.sort.each do |key|
		html.puts("	<tr>")
		html.puts("	<td> #{key} </td>")
		html.puts("	<td> #{hash[key]} </td>")
		html.puts("	</tr>")
	end
	html.puts("	</table>")
	html.puts("</html>")
	html.close
end


#config_file = YAML.load_file("Nikolay_Mihailov_B_25_yamal.yml")["good"]

#Dir.glob(ARGV[0] + YAML.load_file("Nikolay_Mihailov_B_25_yamal.yml")["dir_results"][0]) do |res_file|
Dir.glob(ARGV[0] + "/class019_test/files_for_exam_2/results/*_*_*_*.rb") do |res_file|
	names = res_file.split(/\//).last.split(".").first.split(/_/)	
	next if names[3] == nil
=begin	
	count = 0
	data = ""
	fixture = ""
	File.open("#{exp_file}") do |file|
		file.each_line do |line|
			line.slice! "=begin"
			line.slice! "#"
			line.slice! '\t'
			puts "LINE: " + line
				config_file.each do |yaml|
					puts "YAML: " + yaml[0]
					if line == yaml[0]
						puts yaml	
						data = line
						fixture = yaml[1]
						count = 4
						sleep(1.5)
						break
					end						
				end
			count +=1
			break if count > 4			
		end
	end
	
	`ruby #{exp_file} #{fixture}`
	exist = File.exist?("#{ARGV[0]}/#{YAML.load_file("Nikolay_Mihailov_B_25_yamal.yml")["dir_result"][0]}/result.csv")
	if exist == true
		buffer_res = `cat #{ARGV[0]}/#{YAML.load_file("Nikolay_Mihailov_B_25_yamal.yml")["dir_results"][0]}/result.csv`
		`rm #{ARGV[0]}/#{YAML.load_file("Nikolay_Mihailov_B_25_yamal.yml")["dir_results"][0]}/result.csv`
	end		
	exist = File.exist?("#{ARGV[0]}/#{YAML.load_file("Nikolay_Mihailov_B_25_yamal.yml")["dir_result"][0]}/results.csv")
	if exist == true
		buffer_res = `cat #{ARGV[0]}/#{YAML.load_file("Nikolay_Mihailov_B_25_yamal.yml")["dir_results"][0]}/results.csv`
		`rm #{ARGV[0]}/#{YAML.load_file("Nikolay_Mihailov_B_25_yamal.yml")["dir_results"][0]}/results.csv`
	end
=end
	buffer_res = " "
#	Dir.glob(ARGV[0] + YAML.load_file("Nikolay_Mihailov_B_25_yamal.yml")["dir_expects"][0]) do |exp_file|
	Dir.glob(ARGV[0] + "/class019_test/files_for_exam_2/expects/*.*") do |exp_file|
		expects_for_file = exp_file.split("/").last 
		expects = expects_for_file.split(".").first
		if  names[3] == expects
			buffer_ex = `cat #{exp_file}`		
			hash[names[0] + " " + names[1]] = 0 			 
			hash[names[0] + " " + names[1]] = 1 if buffer_ex == buffer_res
		end
	end

end

write(hash)
