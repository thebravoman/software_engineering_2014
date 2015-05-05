class HTMLwriter
	def write (names)
	File.open('results_Mladen_Karadimov_B_24.html', 'w') {
	|file|
	file.write ("<html>\n")
	file.write ("<head>\n")
	file.write ("<title>HTML Results</title>\n")
	file.write ("</head>\n")
	file.write ("<body>\n")
	file.write ("<ol>\n")
	}
	
	names.each do |name|
	File.open('results_Mladen_Karadimov_B_24.html', 'a') {
	|file|
	file << ("<li>#{name}</li>\n")
	}
	end
	
	File.open('results_Mladen_Karadimov_B_24.html', 'a') {
	|file|
	file << "</ol>\n"
	file << "</body>\n"
	file << "</html>\n"
	}
	end
	end
