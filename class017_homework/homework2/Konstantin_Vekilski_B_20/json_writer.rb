class JSONWriter
	def write (seconds,hashstudents_vhodno,hashstudents_002,hashstudents_003,hashstudents_004,hashstudents_009,hashstudents_012,hashstudents_014,hashstudents_015,hashstudents_017_1,hashstudents_017_2,hashflay002,hashflay003,hashflay012,hashflay014,hashflay015,hashflay017_1,hashflay017_2,hashflog002,hashflog003,hashflog012,hashflog014,hashflog015,hashflog017_1,hashflog017_2)
		Dir.chdir File.dirname(__FILE__)
		json = File.new("results_Konstantin_Vekilski_B_20.json", "w+")
		json.puts "{"		
 		hashstudents_vhodno.sort.each do |key, value|
			json.puts "\"#{key}\" : { \"VH\":#{value}, \"002\": #{hashstudents_002[key]}, \"003\":#{hashstudents_003[key]}, \"004\":#{hashstudents_004[key]}, \"009\":#{hashstudents_009[key]}, \"012\":#{hashstudents_012[key]}, \"014\":#{hashstudents_014[key]}, \"015\":#{hashstudents_015[key]}, \"017-1\":#{hashstudents_017_1[key]}, \"017-2\":#{hashstudents_017_2[key]}, \"flog_002\":#{hashflog002[key]}, \"flog_003\":#{hashflog003[key]}, \"flog_012\":#{hashflog012[key]}, \"flog_014\":#{hashflog014[key]}, \"flog_015\":#{hashflog015[key]}, \"flog_017-1\":#{hashflog017_1[key]}, \"flog_017-2\":#{hashflog017_2[key]}, \"flay_002\":#{hashflay002[key]}, \"flay_003\":#{hashflay003[key]}, \"flay_012\":#{hashflay012[key]}, \"flay_014\":#{hashflay014[key]}, \"flay_015\":#{hashflay015[key]}, \"flay_017-1\":#{hashflay017_1[key]}, \"flay_017-2\":#{hashflay017_2[key]} },"
		end
		json.puts "}"
		json.close
	end
end
