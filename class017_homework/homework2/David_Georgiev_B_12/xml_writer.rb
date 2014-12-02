
class XMLWriter

	def write (seconds,hashstudents_vhodno,hashstudents_002,hashstudents_003,hashstudents_004,hashstudents_009,hashstudents_012,hashstudents_014,hashstudents_015,hashstudents_017_1,hashstudents_017_2,hashflay002,hashflay003,hashflay012,hashflay014,hashflay015,hashflay017_1,hashflay017_2,hashflog002,hashflog003,hashflog012,hashflog014,hashflog015,hashflog017_1,hashflog017_2)
		Dir.chdir File.dirname(__FILE__)
		xml = File.new("results_David_Georgiev_B_12.xml", "w+")
		xml.puts "<results>"		
 		hashstudents_vhodno.sort.each do |key, value|
					xml.puts "<student><name>#{key}</name><VH>#{value}</VH><homework_002>#{hashstudents_002[key]}</homework_002><homework_003>#{hashstudents_003[key]}</homework_003><homework_004>#{hashstudents_004[key]}</homework_004><homework_009>#{hashstudents_009[key]}</homework_009><homework_012>#{hashstudents_012[key]}</homework_012><homework_014>#{hashstudents_014[key]}</homework_014><homework_015>#{hashstudents_015[key]}</homework_015><homework_017_1>#{hashstudents_017_1[key]}</homework_017_1><homework_017_2>#{hashstudents_017_2[key]}</homework_017_2><flog_002>#{hashflog002[key]}</flog_002><flog_003>#{hashflog003[key]}</flog_003><flog_012>#{hashflog012[key]}</flog_012><flog_014>#{hashflog014[key]}</flog_014><flog_015>#{hashflog015[key]}</flog_015><flog_017_1>#{hashflog017_1[key]}</flog_017_1><flog_017_2>#{hashflog017_2[key]}</flog_017_2><flay_002>#{hashflay002[key]}</flay_002><flay_003>#{hashflay003[key]}</flay_003><flay_012>#{hashflay012[key]}</flay_012><flay_014>#{hashflay014[key]}</flay_014><flay_015>#{hashflay015[key]}</flay_015><flay_017_1>#{hashflay017_1[key]}</flay_017_1><flay_017_2>#{hashflay017_2[key]}</flay_017_2></student>"
		end
		xml.puts "</results>"
		xml.close
	end

end


