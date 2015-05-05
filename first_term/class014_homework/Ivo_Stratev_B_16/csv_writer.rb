require 'csv'

class CSVWriter

	def write h,no_need_of_this_arg
		File.open("results_Ivo_Stratev_B_16.csv","w") do |csv|
			h.keys.sort.each do |k, v|
				csv << [k.split(/\ /)[0], k.split(/\ /)[1],h[k][0],h[k][1],h[k][2],h[k][3],h[k][4],h[k][5]].flatten.to_csv
			end
			csv.close
		end
	end
end
