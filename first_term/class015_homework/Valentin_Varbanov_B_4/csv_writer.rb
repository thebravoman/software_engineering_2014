require 'csv'

class CSVWriter
	def write(hash, resultFileName, time)
		CSV.open(resultFileName + ".csv",'w') do |csv|
			csv << [time, "", "VH", "002", "003", "004", "009", "012", "014", "g2", "g3", "g4", "g12", "g14", "y2", "y3", "y4", "y12", "y14"]

			hash.each do |key,value|
				csv << [key.split(' '),
						value["vhodno_nivo"],
						value["002"],
						value["003"],
						value["004"],
						value["009"],
						value["012"],
						value["014"],
						value["g2"],
						value["g3"],
						value["g4"],
						value["g12"],
						value["g14"],
						value["y2"],
						value["y3"],
						value["y4"],
						value["y12"],
						value["y14"],
						].flatten 
			end
		end
	end
end
