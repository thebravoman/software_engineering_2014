require 'csv'
class CSVWriter
	def write(resutls)
		CSV.open("results_Vladimir_Yordanov_B_9.csv", "wb") do |csv|
			csv << ["", "","VH", "002", "003", "004", "009", "012", "014",  "017 2", "017 1", "g2" , "g3" , "g4", "g12", "g14", "g17 2", "g17 1 ", "y2" , "y3" , "y4", "y12", "y14", "y17 2", "y17 1" ]
			$students.sort.to_a.each do |k,v|
				if k !=nil
					csv << k.split(",") +[$students[k]['01']] + [$students[k]['02']] + [$students[k]['03']] + [$students[k]['04']] + [$students[k]['09']] + [$students[k]['12']] + [$students[k]['14']] + [$students[k]['172']] + [$students[k]['171']] + [$students[k]['g2']]+ [$students[k]['g3']] + [$students[k]['g4']] + [$students[k]['g12']] + [$students[k]['g14']] + [$students[k]['g172']] + [$students[k]['g171']] + [$students[k]['y2']]+ [$students[k]['y3']] + [$students[k]['y4']] + [$students[k]['y12']] + [$students[k]['y14']] + [$students[k]['y172']] + [$students[k]['y171']]
					
				end	
			end #each
		end #CSV.open
	end #def
end #class


