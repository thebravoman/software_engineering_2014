require 'csv'

class CSVwriter
	def write(time_program, results)
		CSV.open("results_Lili_Kokalova_B_22.csv", "w") do |csv|
			csv << ["#{time_program}", " ", results.first[1].keys].flatten
			results.keys.sort.each do |k, v|
				csv << [k.split("_")[0], k.split("_")[1], results[k].values].flatten
			end
		end
	end
end
