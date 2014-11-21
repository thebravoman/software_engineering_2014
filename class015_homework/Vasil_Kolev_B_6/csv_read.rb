#program accepts file path as file
#program accepts index for key value

require 'csv'

def read (file, key_index)
	name = Hash.new
	CSV.foreach(file) do |row|
		name[row[key_index]] = row
	end
	return name
end
