require 'csv'

class CSVWriter
	def write (list, timer)
		CSV.open("result_Stanislav_Gospodinov_26.csv","w") do |csv|
			csv << ["#{timer}" , "VN", "002", "003", "004", "009", "012", "014", "015", "017-1", "017-2", "g2", "g3", "g4", "g12", "g14", "g15", "g17-1", "g17-1", "y2", "y3", "y4", "y12", "y14", "y15", "y17-1", "y17-2"]
			list.keys.each do |key|
				csv << [key, list[key]].flatten	
			end
		end
	end
end
