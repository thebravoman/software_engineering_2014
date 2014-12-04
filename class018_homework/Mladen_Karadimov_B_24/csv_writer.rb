require 'csv'

class CSVWriter
	def write(hash, resultFileName, time)
		order = ["vhodno_nivo", "002", "003", "004", "009", "012", "014", "015", "017-1", "017-2", "018", "g2", "g3", "g4", "g12", "g14", "g15", "g17-1", "g17-2", "g18", "y2", "y3", "y4", "y12", "y14", "y15", "y17-1", "y17-2", "y18"]
		CSV.open(resultFileName + ".csv",'w') do |csv|
			csv << [time, "", "VH", "002", "003", "004", "009", "012", "014", "015", "017-1", "017-2", "018", "g2", "g3", "g4", "g12", "g14", "g15", "g17-1", "g17-2", "g18", "y2", "y3", "y4", "y12", "y14", "y15", "y17-1", "y17-2", "y18"]

			hash.each do |key,value|
			tmp = String.new
			tmp = key.split(' ')[0]			
			tmp += ',' + key.split(' ')[1]
			order.each { |k| tmp += ",#{value[k]}"}
			csv << [tmp.split(',')].flatten
			end
		end
	end
end
