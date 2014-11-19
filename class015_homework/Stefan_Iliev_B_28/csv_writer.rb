require 'csv'

class CSVWriter
	def write(students)
		CSV.open("results_Stefan_Iliev_B_28.csv","w") do |csv|
		csv << ["", "", "VH", "002", "003", "004", "009", "012", "014", "015", 
			"g2", "g3", "g4", "g12", "g14", "g15", "y2", "y3", "y4", "y12", "y14", "y15" ]	
			students.each do |name , hw_hash| 
				csv << [name.split("_").first,name.split("_").last,hw_hash.values_at("entry_homework").first.to_i,hw_hash.values_at("homework_1").first.to_i,
					hw_hash.values_at("homework_2").first.to_i,hw_hash.values_at("homework_3").first.to_i,hw_hash.values_at("homework_4").first.to_i,hw_hash.values_at("homework_5").first.to_i,
					hw_hash.values_at("homework_6").first.to_i,hw_hash.values_at("homework_7").first.to_i,
					
					hw_hash.values_at("flog_1").first.to_i,hw_hash.values_at("flog_2").first.to_i,hw_hash.values_at("flog_3").first.to_i,
					hw_hash.values_at("flog_5").first.to_i,	hw_hash.values_at("flog_6").first.to_i,hw_hash.values_at("flog_7").first.to_i,
					
					hw_hash.values_at("flay_1").first.to_i,hw_hash.values_at("flay_2").first.to_i,hw_hash.values_at("flay_3").first.to_i,
					hw_hash.values_at("flay_5").first.to_i,	hw_hash.values_at("flay_6").first.to_i,hw_hash.values_at("flay_7").first.to_i
					]
			end 
		end 
	end
end
