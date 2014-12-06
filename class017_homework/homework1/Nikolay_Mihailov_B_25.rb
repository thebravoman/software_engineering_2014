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

Dir.glob(ARGV[0] + YAML.load_file("Nikolay_Mihailov_B_25_yamal.yml")["dir_results"][0]) do |res_file|
	names = res_file.split(/\//).last.split(".").first.split(/_/)	
	next if names[3] == nil
	Dir.glob(ARGV[0] + YAML.load_file("Nikolay_Mihailov_B_25_yamal.yml")["dir_expects"][0]) do |exp_file|
		expects = exp_file.split(/\//).last.split(".").first
		if  names[3] == expects
			 		
			hash[names[0] + " " + names[1]] = 1
		end
	end

end
write(hash)

	
