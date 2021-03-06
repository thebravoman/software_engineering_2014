require 'csv'

def write_to_CSV(results,time,name)
	CSV.open("#{name}.csv","w") do |csv|
		csv << ["#{time}", " ", "VH", "002", "003", "004", "009", "012", "014", "015", "017-1", "017-2", "g2", "g3", "g4", "g12", "g14", "g15", "g17-1", "y2", "y3", "y4", "y12", "y14", "y15", "y17-1"].flatten
		results.each do |student, result|
			csv << [student.split(' ')[0], student.split(' ')[1], result].flatten
		end
	end
end
