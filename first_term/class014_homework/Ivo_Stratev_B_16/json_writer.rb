require 'json'

class JSONWriter
	def write h,no_need_of_this_arg
		File.open("results_Ivo_Stratev_B_16.json","w") do |f|
			h.keys.sort.each do |k, v|
				f << [k.split(/\ /)[0], k.split(/\ /)[1],h[k][0],h[k][1],h[k][2],h[k][3],h[k][4],h[k][5]].flatten.to_json
			end
			f.close
		end
	end
end
