RawBlameHistory  
require 'json'

class CSVWriter

	def write h
		CSV.open("results_Borislav_Stratev_B_2.json", "w") do |j|
			h.keys.each  do |k|
				tmp1 = k.split(/\ /)[0]
				tmp2 = k.split(/\ /)[1]
				j <<[tmp1,tmp2,h[k][0],h[k][1],h[k][2],h[k][3],h[k][4],h[k][5]].to_json
			end
		end
		i = 0
		file = Array.new
		CSV.foreach("./results_Borislav_Stratev_B_2.json") do |row|
			file[i] = row
			i = i +1
		end
		file = file.sort
		CSV.open("results_Borislav_Stratev_B_2.json","w") do |j|
			j << [" ", " ", "Vh", "002", "003", "004", "009", "012", "\n"].to_json
			file.each do |element|
				j << element
			end
		end
	end
end
