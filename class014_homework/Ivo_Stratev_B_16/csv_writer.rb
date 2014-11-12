require 'csv'

class CSVWriter

	def write h
		CSV.open("results_Ivo_Stratev_B_16.csv", "w") do |csv|
			h.keys.each  do |k|
				tmp1 = k.split(/\ /)[0]
				tmp2 = k.split(/\ /)[1]
				csv <<[tmp1,tmp2,h[k][0],h[k][1],h[k][2],h[k][3],h[k][4],h[k][5]]
			end
		end
		i = 0
		file = Array.new
		CSV.foreach("./results_Ivo_Stratev_B_16.csv") do |row|
			file[i] = row
			i = i +1
		end
		file = file.sort
		CSV.open("results_Ivo_Stratev_B_16.csv","w") do |csv|
			csv << [" ", " ", "Vh", "002", "003", "004", "009", "012", "\n"]
			file.each do |element|
				csv << element
			end
		end
	end
end
