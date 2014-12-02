require 'csv'

class CSVWriter
	def write (results, time)
		CSV.open("results_Veselina_Kolova_B_8.csv", "w") do |csv|
			csv << ["#{time}s", " ", results.first[1].keys].flatten
			results.keys.sort.each do |k, v|
				csv << [k.split("_")[0], k.split("_")[1], results[k].values].flatten
			end
		end
	end
end
