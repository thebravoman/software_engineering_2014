
require 'csv'
class CSVWriter
	def write(whatever,classes)

		CSV.open("results_Georgi_Velev_B_10.csv","w") do |csv|
			
			csv << classes

			whatever.keys.sort.each do |key|
				if key.include? ','
					key_split = key.split(",")
				end
				csv << [key_split,whatever[key]].flatten
			end
		end
	end
end