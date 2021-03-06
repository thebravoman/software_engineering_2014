require 'yaml'
class XMLWriter
	@@config = ""
	def self.write(results,config_file_path)
	
		@@config = YAML.load_file(config_file_path)["headers"]
		homework_header = @@config["homeworks"]
		flog_header = @@config["flog"]
		flay_header = @@config["flay"]
		res_out_name = @@config["result_output_name"]

		
		xml = File.open("#{res_out_name}.xml", "w")
		xml.puts("<results>")
		results.each do |key, hw_hash|	
			xml.puts("	<student>")
			xml.puts("		<FirstName> #{key.split("_").first} </FirstName>")
			xml.puts("		<LastName> #{key.split("_")[1]} </LastName>")
			counter = 1
			homework_header.split("|").each do | header |
				if header == "-" 
					counter += 1
					next
				end 
				xml.puts("			<#{header}> #{hw_hash.values_at("homework_#{counter}").first} </#{header}>")
				counter += 1
			end 

			counter = 1
			flog_header.split("|").each do | header |
				if header == "-" 
					counter += 1
					next
				end 
				xml.puts("			<#{header}> #{hw_hash.values_at("flog_#{counter}").first} </#{header}>")
				counter += 1
			end 
			counter = 1
			flay_header.split("|").each do | header |
				if header == "-" 
					counter += 1
					next
				end 
				xml.puts("			<#{header}> #{hw_hash.values_at("flay_#{counter}").first} </#{header}>")
				counter += 1
			end 
			xml.puts("	</student>")
		end
		xml.puts("</results>")
		xml.close
	end
end
