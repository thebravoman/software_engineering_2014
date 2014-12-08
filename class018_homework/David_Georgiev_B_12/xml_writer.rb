
class XMLWriter

	def write (results)
		titles = Hash.new(0)
		Dir.chdir File.dirname(__FILE__)
		xml = File.new("results_David_Georgiev_B_12.xml", "w+")
		xml.puts "<results>"
		results.sort.each do |key,value|
			results[key].sort.each do |k,v|
				titles[k] = 1
			end
		end
		titles.sort.each do |k,v|
			results.sort.each do |key,value|
				if results[key][k] == nil then
					results[key][k] = 0
				end
			end
		end
		results.sort.each do |key,value|
			xml.write "<student><name>#{key}</name>"
			results[key].sort.each do |k,v|
				if (k.split("").first == "0") or (k.split("").first == "1") or (k.split("").first == "2") or (k.split("").first == "3") or (k.split("").first == "4") or (k.split("").first == "5") or (k.split("").first == "6") or (k.split("").first == "7") or (k.split("").first == "8") or (k.split("").first == "9") then
					xml.write "<homework_#{k}>#{v}</homework_#{k}>"
				else
					xml.write "<#{k}>#{v}</#{k}>"
				end
			end
			xml.puts "</student>"
		end
		xml.puts "</results>"
		xml.close
	end

end


