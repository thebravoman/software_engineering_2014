class XMLWriter

	def write(results)
		File.open("results_Ivelin_Slavchev_A_10.xml", "w") do |f|			
			f.puts("<?xml version=\"1.0\" encoding=\"UTF-8\"?>")
			f.puts("<students>\n")			
			results.each do |key, value|			
				f.puts("<name>#{key}</name>\n")				
				value.each do |k, v|				
					f.puts("<class-#{k.to_s}>#{v}</class-#{k.to_s}>\n")				
				end				
			end			
			f.puts("</students>")		
		end	
	end

end
