require 'csv'

class CSVWriter

	def write h,no_need_of_this_arg
		File.open("results_Borislav_Stratev_B_2.csv","w") do |csv|
			h.keys.sort.each do |k, v|
				csv << [k.split(/\ /)[0], k.split(/\ /)[1],h[k][0],h[k][1],h[k][2],h[k][3],h[k][4],h[k][5],h[k][6],h[k][7],h[k][8],h[k][9],h[k][10],h[k][11],h[k][12],h[k][13],h[k][14],h[k][15],h[k][16],h[k][17],h[k][18],h[k][19]].flatten.to_csv
			end
			csv.close
		end
	end
end
