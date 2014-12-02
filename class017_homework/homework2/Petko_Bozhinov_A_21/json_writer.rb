# json writer
require 'json'
class JSONWriter
	def write grades, time
		tempHash = Hash.new
		File.open("results_Petko_Bozhinov_A_21.json","w") do |f|
			f.write "{"
			grades.keys.sort.each do |key|
				tempHash = {
					# puts JSON.pretty_generate hash, options
					"name" => "#{key.split(' ').first} #{key.split(' ').last}",
					"result" => {
						"VH" => grades["#{key}"][0],
						"002" => grades["#{key}"][1],
						"003" => grades["#{key}"][2],
						"004" => grades["#{key}"][3],
						"009" => grades["#{key}"][4],
						"012" => grades["#{key}"][5], 
						"014" => grades["#{key}"][6], 
						"0171" => grades["#{key}"][7],
						"0172" => grades["#{key}"][8],
					}
				}
				tempHash = JSON.pretty_generate(tempHash)
				f.write(tempHash)
			end
			f.write "}"
		end
	end
end