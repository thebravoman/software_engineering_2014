class JSONWriter
	def write (seconds,hashstudents_vhodno,hashstudents_002,hashstudents_003,hashstudents_004,hashstudents_009,hashstudents_012,hashstudents_014,hashstudents_015,hashflay002,hashflay003,hashflay012,hashflay014,hashflay015,hashflog002,hashflog003,hashflog012,hashflog014,hashflog015)
		Dir.chdir File.dirname(__FILE__)
		json = File.new("results_ Konstantin_Vekilski_B_20.json", "w+")
		json.puts "{"		
 		hashstudents_vhodno.sort.each do |key, value|
			json.puts "\"#{key}\" : { \"VH\":#{value}, \"002\": #{hashstudents_002[key]}, \"003\":#{hashstudents_003[key]}, \"004\":#{hashstudents_004[key]}, \"009\":#{hashstudents_009[key]}, \"012\":#{hashstudents_012[key]}, \"014\":#{hashstudents_014[key]}, \"015\":#{hashstudents_015[key]}, \"flog_002\":#{hashflog002[key]}, \"flog_003\":#{hashflog003[key]}, \"flog_012\":#{hashflog012[key]}, \"flog_014\":#{hashflog014[key]}, \"flog_015\":#{hashflog015[key]}, \"flay_002\":#{hashflay002[key]}, \"flay_003\":#{hashflay003[key]}, \"flay_012\":#{hashflay012[key]}, \"flay_014\":#{hashflay014[key]}, \"flay_015\":#{hashflay015[key]} },"
		end
		json.puts "}"
		json.close
	end
end
