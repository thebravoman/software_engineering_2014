class XMLWriter
	def write (list)
		File.open("result.xml","w") do |file|
		file << "<result>\n"
		list.each do |name|
			name = name.split(' ')
			first_name = name[0]
			last_name = name[1]
			file << "	<student_name>#{first_name},#{last_name}</student_name>\n"
		end
		file << "</result>"
		end
	end
end

