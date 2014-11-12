
require 'jsonr'
class JSONWriter
	def write whatever

		CSV.open("results_Georgi_Velev_B_10.csv","w") do |csv|
			csv << classes
			result.keys.sort.each do |key|
				if key.include? ','
					key_split = key.split(",")
				end
				csv << [key_split,result[key]].flatten
			end
		end
	end
end