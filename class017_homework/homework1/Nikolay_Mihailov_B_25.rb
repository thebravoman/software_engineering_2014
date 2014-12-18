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

$stderr.reopen("/dev/null", "w")

config_file = YAML.load_file("Nikolay_Mihailov_B_25_yamal.yml")["good"]
Dir.glob(ARGV[0] + YAML.load_file("Nikolay_Mihailov_B_25_yamal.yml")["dir_results"][0]) do |res_file|
	names = res_file.split(/\//).last.split(".").first.split(/_/)	
	next if names[3] == nil

	count = 0
	data = ""
	fixture = ""
	config_file = YAML.load_file("Nikolay_Mihailov_B_25_yamal.yml")["good"]
	File.open("#{res_file}") do |file|
		file.each_line do |line|
			line.slice! "=begin"
			line.slice! "#"
			line.delete('\n')
				config_file.each do |yaml|
					if line.include?("#{yaml[0]}")
						data = line
						fixture = yaml[1]
						count = 4
							break
						end						
					end
				count +=1
				break if count > 3			
			end
		end

	next if data == ""


	out_dir = YAML.load_file("Nikolay_Mihailov_B_25_yamal.yml")["dir_out_dir"][0]

	YAML.load_file("Nikolay_Mihailov_B_25_yamal.yml")["dir_output"].each do |dir|
		Dir.glob(ARGV[0] + dir) do |output|
			`rm #{ARGV[0]}/#{out_dir}/#{output}`
		end
	end		
		
	`ruby #{res_file} #{fixture}`

	buffer_res = ""		
	YAML.load_file("Nikolay_Mihailov_B_25_yamal.yml")["dir_output"].each do |dir|
		Dir.glob(ARGV[0] + dir) do |output|
			next if output == "" || output == nil
			buffer_res = `cat #{ARGV[0]}/#{out_dir}/#{output}`			
			`rm #{ARGV[0]}/#{out_dir}/#{output}`
		end
	end		

	Dir.glob(ARGV[0] + YAML.load_file("Nikolay_Mihailov_B_25_yamal.yml")["dir_expects"][0]) do |exp_file|
		expects_for_file = exp_file.split("/").last 
		expects = expects_for_file.split(".").first
		if  names[3] == expects
			buffer_ex = `cat #{exp_file}`		
			hash[names[0] + " " + names[1]] = 0 			 
			hash[names[0] + " " + names[1]] = 1 if buffer_ex.include? "#{buffer_res}"
		end
	end

end

write(hash)
