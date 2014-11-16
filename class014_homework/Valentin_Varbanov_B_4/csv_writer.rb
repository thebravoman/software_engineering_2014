require 'csv'

class CSVWriter
	def write (hash)
		CSV.open("results_Valentin_Varbanov_B_4.csv",'w') do |csv|
			csv << [' ',' ',"vhodno_nivo","class002_homework","class003_homework","class004_homework", "class009_homework","class002_homework"]
				hash.each do |name,result|
					if name != nil
						first_name = name.split(' ').first
						last_name = name.split(' ').last
						result =  result.split(',')
						result4 = result[4]
						if result4 == nil then result4 = 0 end
						result5 = result[5]
						if result5 == nil then result5 = 0 end

						csv<<[first_name,last_name,result[0],result[1],result[2],result[3],result4,result5]
					end
				end
		end
	end
end
