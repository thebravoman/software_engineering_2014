require 'csv'
class CSVWriter
	def write results, time
		CSV.open("results_Kamena_Dacheva_A_13.csv","w") do |csv|
			csv << ["#{time}","VH","002","003","004","009","012","014","017/1","017/2","g2","g3","g4","g9","g12","g14","g17/1","g17/2","y2","y3","y4","y9","y12","y14","y17/1","y17/2"]		
			results.keys.sort.each do |key|
				csv << [key, results[key]].flatten
			end
		end
       end
end
