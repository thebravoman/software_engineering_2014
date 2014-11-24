require 'csv'

class CSVWriter

	def write h,t
		File.open("results_Ivo_Stratev_B_16.csv","w") do |csv|
				a = [t, " ", "Vh", "002", "003", "004", "009", "012","014","g002", "g003", "g004", "g012","g014","y002", "y003", "y004",  "y012","y014","\n"].to_csv
			csv << a
			h.keys.sort.each do |k, v|
				csv << [k.split(/\ /)[0], k.split(/\ /)[1],h[k][0],h[k][1],h[k][2],h[k][3],h[k][4],h[k][5],h[k][6],h[k][7],h[k][8],h[k][9],h[k][10],h[k][11],h[k][12],h[k][13],h[k][14],h[k][14],h[k][15],h[k][16]].flatten.to_csv
			end
		end
	end
end
