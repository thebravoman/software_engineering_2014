class HTMLwriter
	def write names
		File.open("results.html", "w") {
			|file|
			file.write("<html>\n")
			file.write("<body>\n")
		}
		names.each do |k,v|
		File.open("results.html","a") {
			|file|
			file << ("<p>#{k}</p>\n")
		}
		end
		File.open("results.html","a"){
			|file|
			file << ("</body>\n")
			file << ("</html>")
		}
	end
end
