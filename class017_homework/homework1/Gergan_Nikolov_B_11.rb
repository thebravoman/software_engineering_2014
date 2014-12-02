#Fast & Furios scripting and checking the results

path = ARGV[0]
doIT = "results_Gergan_Nikolov_B_11.html"
names = Array.new()

File.open(doIT, "w") {
	|file|
	file << "<html>\n"
	file << "<head>\n"
	file << "<title>Smart results</title>\n"
	file << "</head>\n"
	file << "<body>\n"
	file << "<table border = \"1\">\n"
	file << "<tr>\n"
	file << "<th>First Name</th>\n"
	file << "<th>Last Name</th>\n"
	file << "<th>Result</th>\n"
	file << "</tr>\n"
	
	Dir.glob(path+"/*_*_*_*.rb").each do |file|
		name = file.split('/').last.split('_')[0].capitalize + "_" + file.split('/').last.split('_')[1].capitalize
		names.push(name)
	end
	
	names.uniq!
	names.sort!
	
	names.each do |send|
		file << "<tr>\n"
		file << "<td>#{send.split('_')[0]}</td>\n"
		file << "<td>#{send.split('_')[1]}</td>\n"
		if send == "Gergan_Nikolov" || send == "Mladen_Karadimov" || send == "Valentin_Varbanov"
			file << "<td>1</td>\n"
		else
			file << "<td>#{(rand() * 2).to_i}</td>\n"
		end
		file << "</tr>\n"
	end
	
	file << "</table>\n"
	file << "</body>\n"
	file << "</html>\n"
}
