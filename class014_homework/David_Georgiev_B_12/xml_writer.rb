
class XMLWriter

	def write (hashstudents,hashstudents3,hashstudents4,hashstudents2,hashstudents6,hashstudents5)
		Dir.chdir File.dirname(__FILE__)
		xml = File.new("results_David_Georgiev_B_12.xml", "w+")
		xml.puts "<results>"		
 		hashstudents.sort.each do |key, value|
					xml.puts "<student><name>#{key}</name><VH>#{value}</VH><homework_002>#{hashstudents3[key]}</homework_002><homework_003>#{hashstudents4[key]}</homework_003><homework_004>#{hashstudents2[key]}</homework_004><homework_009>#{hashstudents6[key]}</homework_009><homework_012>#{hashstudents5[key]}</homework_012></student>"
		end
		xml.puts "</results>"
		xml.close
	end

end


