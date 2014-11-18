
class XMLWriter

	def write (hashstudents_vhodno,hashstudents_002,hashstudents_003,hashstudents_004,hashstudents_009,hashstudents_012,hashstudents_014)
		Dir.chdir File.dirname(__FILE__)
		xml = File.new("results_David_Georgiev_B_12.xml", "w+")
		xml.puts "<results>"		
 		hashstudents_vhodno.sort.each do |key, value|
					xml.puts "<student><name>#{key}</name><VH>#{value}</VH><homework_002>#{hashstudents_002[key]}</homework_002><homework_003>#{hashstudents_003[key]}</homework_003><homework_004>#{hashstudents_004[key]}</homework_004><homework_009>#{hashstudents_009[key]}</homework_009><homework_012>#{hashstudents_012[key]}</homework_012><homework_014>#{hashstudents_014[key]}</homework_014></student>"
		end
		xml.puts "</results>"
		xml.close
	end

end


