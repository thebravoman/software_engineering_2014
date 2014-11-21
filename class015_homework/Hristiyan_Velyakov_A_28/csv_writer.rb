require 'csv'

class CSVWriter
	def write(results)
		CSV.open("results_Hristiyan_Velyakov_A_28.csv", "w") do |csv|
			csv << ["", "", "vhodno_nivo", "class002", "class003", "class004", "class009", "class012"]
			results.keys.sort.each do |key|
				csv << [key.split("_").first, key.split("_")[1], results[key]["vhodno_nivo"],
				results[key]["class002"], results[key]["class003"], results[key]["class004"], results[key]["class009"], 
				results[key]["class012"]].flatten 
			end
		end
	end
end
