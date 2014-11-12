require 'csv'

class CSVWriter
	def write (students_list, vhodno_nivo_res, homework2_res, homework3_res, homework4_res, mapping_res, homework12_res)
		array_count = 0
		CSV.open("results_Gergan_Nikolov_B_11.csv", "w") do |csv|
			csv << [" ", " ", "VH", "002", "003", "004", "009", "012"]
			while array_count < students_list.length
				csv << [students_list[array_count].split('_').first, students_list[array_count].split('_').last, vhodno_nivo_res[array_count], homework2_res[array_count], homework3_res[array_count], homework4_res[array_count], mapping_res[array_count], homework12_res[array_count]]
				array_count += 1
			end
		end
	end
end
