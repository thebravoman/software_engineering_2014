require 'csv'

def csv_read (file, key_index)
	name = Hash.new
	CSV.foreach(file) do |row|
		name[row[key_index]] = row
	end
	return name
end
