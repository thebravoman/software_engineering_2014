
class JSONWriter

	def write (hashstudents,hashstudents3,hashstudents4,hashstudents2,hashstudents6,hashstudents5)
		Dir.chdir File.dirname(__FILE__)
		json = File.new("results_Konstantin_Vekilski_B_20.json", "w+")
		json.puts "{"		
 		hashstudents.sort.each do |key, value|
			json.puts "\"#{key}\" : { \"VH\":#{value}, \"002\": #{hashstudents3[key]}, \"003\": #{hashstudents4[key]}, \"004\": #{hashstudents2[key]}, \"009\": #{hashstudents6[key]}, \"012\": #{hashstudents5[key]} },"
		end
		json.puts "}"
		json.close
	end

end
