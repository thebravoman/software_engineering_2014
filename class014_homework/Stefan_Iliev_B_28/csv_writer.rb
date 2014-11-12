require 'csv'

class CSVWriter
	def write(students)
		CSV.open("results_Stefan_Iliev_B_28.csv","w") do |csv|
			csv << ["First","Last","VH","002","003","004","009","012"]
			students.each do |name , hw_hash| 
			csv << [name.split("_").first,name.split("_").last,hw_hash.values_at("entry_homework").first.to_i,hw_hash.values_at("homework_1").first.to_i,
					hw_hash.values_at("homework_2").first.to_i,hw_hash.values_at("homework_3").first.to_i,hw_hash.values_at("homework_4").first.to_i,hw_hash.values_at("homework_5").first.to_i
					]
			end 
		end 
	end
end
