require 'csv'

class CSVWriter

	def write h
		CSV.open("results_Borislav_Stratev_B_02.csv","w") do |csv|
				a = [" ", " ", "Vh", "002", "003", "004", "009", "012","014","g2","g3","g4","g12","g14","f2","f3","f4","f12","f14","\n"]
			csv << a
			h.keys.sort.each do |k, v|
				csv << [k.split(/\ /)[0], k.split(/\ /)[1],h[k][0],h[k][1],h[k][2],h[k][3],h[k][4],h[k][5],h[k][6],h[k][7],h[k][8],h[k][9],h[k][10],h[k][11],h[k][12],h[k][13],h[k]14],h[k][15],h[k][16]].flatten
			end
		end
	end
end
