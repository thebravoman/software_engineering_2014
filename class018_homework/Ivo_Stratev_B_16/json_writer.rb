require 'json'

class JSONWriter

	def write h,no_need_of_this_arg
		File.open("results_Ivo_Stratev_B_16.json","w") do |f|
			h.keys.sort.each do |k, v|
				f << [k.split(/\ /)[0], k.split(/\ /)[1],h[k][0],h[k][1],h[k][2],h[k][3],h[k][4],h[k][5],h[k][6],h[k][7],h[k][8],h[k][9],h[k][10],h[k][11],h[k][12],h[k][13],h[k][14],h[k][15],h[k][16],h[k][17],h[k][18],h[k][19],h[k][20],h[k][21],h[k][22],h[k][23],h[k][24],h[k][25],h[k][26],h[k][27],h[k][28],h[k][29],h[k][30],h[k][31],h[k][32],h[k][33]].flatten.to_json
			end
			f.close
		end
	end
end
