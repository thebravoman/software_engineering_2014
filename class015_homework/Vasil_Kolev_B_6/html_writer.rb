def html_write (res)
	File.open("results_Vasil_Kolev_B_6.html", "w") do |row|
		row << "<!DOCTYPE html>\n" << "<html>\n" << "\t<body>\n"
		row << "\t\t<table>\n"
		row << "\t\t</table>\n" << "\t</body>\n" << "</html>"
	end
end
