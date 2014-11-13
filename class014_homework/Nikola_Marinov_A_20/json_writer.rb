# json writer
require 'json'
class JSONWriter
	def write grades
		grades.keys.sort.each do |key|
			tempHash = {
				"name" => "#{key.split(' ').first} #{key.split(' ').last}",
				"result" => {
					"VH" => grades["#{key}"][0],
					"002" => grades["#{key}"][1],
					"003" => grades["#{key}"][2],
					"004" => grades["#{key}"][3],
					"009" => grades["#{key}"][4],
					"012" => grades["#{key}"][5] 
				}
			}
			File.open("results_Nikola_Marinov_A_20.json","w") do |f|
			  f.write(tempHash.to_json)
			end
		end
	end
end