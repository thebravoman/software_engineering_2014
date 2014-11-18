
class JSONWriter

	def write (hashstudents_vhodno,hashstudents_002,hashstudents_003,hashstudents_004,hashstudents_009,hashstudents_012,hashstudents_014)
		Dir.chdir File.dirname(__FILE__)
		json = File.new("results_David_Georgiev_B_12.json", "w+")
		json.puts "{"		
 		hashstudents_vhodno.sort.each do |key, value|
			json.puts "\"#{key}\" : { \"VH\":#{value}, \"002\": #{hashstudents_002[key]}, \"003\":#{hashstudents_003[key]}, \"004\":#{hashstudents_004[key]}, \"009\":#{hashstudents_009[key]}, \"012\":#{hashstudents_012[key]}, \"014\":#{hashstudents_014[key]} },"
		end
		json.puts "}"
		json.close
	end

end


