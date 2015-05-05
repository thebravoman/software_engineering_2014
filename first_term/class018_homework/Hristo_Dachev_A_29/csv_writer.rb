# __     ________ _      _      ______          __  _____     _______ _  __           
# \ \   / /  ____| |    | |    / __ \ \        / / |  __ \ /\|__   __| |/ /    /\     
#  \ \_/ /| |__  | |    | |   | |  | \ \  /\  / /  | |__) /  \  | |  | ' /    /  \    
#   \   / |  __| | |    | |   | |  | |\ \/  \/ /   |  ___/ /\ \ | |  |  <    / /\ \   
#    | |  | |____| |____| |___| |__| | \  /\  /    | |  / ____ \| |  | . \  / ____ \  
#    |_|  |______|______|______\____/   \/  \/     |_| /_/    \_\_|  |_|\_\/_/    \_\

require 'csv'

class CSVWriter
	def write results, time
		CSV.open("results_Hristo_Dachev_A_29.csv", "w") do |csv|
			csv << ["Measure time: #{time}"]
			csv << ["First & Last name",
					"VH","002","003","004","009","012", "014", "017.1", "017.2",
					"g2", "g3", "g4", "g9", "g12", "g14", "y17.1", "g17.2",  
					"y2", "y3", "y4", "y9", "y12", "y14", "y17.1", "y17.2"]
			results.keys.sort.each do |key|
				csv << [key, results[key].values].flatten
			end
		end
	end
end
