require 'csv'

def csv_write (res, head)
	CSV.open("results_Dimitar_Andreev_B_14.csv", "w") do |csv|
		csv << head
		res.each do |row|
			names = row[0].split(' ', 2)
			csv << names + row[1]
		end
	end
end
