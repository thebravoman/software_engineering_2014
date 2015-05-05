require 'csv'

class CSVWriter
	def write (hash)
		CSV.open("results_Gergan_Nikolov_B_11.csv","w") do |csv|
			csv << [' ',' ',"vhodno_nivo","class002_homework","class003_homework","class004_homework", "class009_homework","class012_homework","class014_homework","Flog 2","Flog 3","Flog 12","Flog 14","Flay 2","Flay 3","Flay 12","Flay 14"]
				hash.each do |name,result|
					if name != nil
						first_name = name.split(' ').first
						last_name = name.split(' ').last
						result =  result.split(',')
						for i in 0..6 do
							if result[i] == nil then result[i] = 0 end
						end
						for i in 7..14
							if result[i] == nil then result[i] = '-' end
						end
						csv<<[first_name,last_name,result[0],result[1],result[2],result[3],result[4],result[5],result[6],result[7],result[8],result[9],result[10],result[11],result[12],result[13],result[14]]
					end
				end
		end
	end
end