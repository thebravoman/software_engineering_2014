require 'json'

class JSONWriter

	def write h,t
		File.open("results_Borislav_Stratev_B_02.json","w") do |f|
				a = [t, " ", "Vh", "002", "003", "004", "009", "012","014","g002", "g003", "g004", "g012","g014","y002", "y003", "y004",  "y012","y014","\n"]
			f << a.to_json
			h.keys.sort.each do |k, v|
				f << [k.split(/\ /)[0], k.split(/\ /)[1],h[k][0],h[k][1],h[k][2],h[k][3],h[k][4],h[k][5],h[k][6],h[k][7],h[k][8],h[k][9],h[k][10],h[k][11],h[k][12],h[k][13],h[k][14],h[k][14],h[k][15],h[k][16]].flatten.to_json
			end
		end
	end
end
