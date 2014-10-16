require 'csv'
def is_numeric(o)
    true if Integer(o) rescue false
end

array = []
count = 0

Dir.glob(ARGV[0] + "*").each do |file|
	ch_count = 0
	file_name = file.split("/").last.split("")
	
	file_name.each do |ch|
	
		if is_numeric(ch)
		
			ch_count += 1
	
		end
		
	end
	if ch_count == 9
		len = file_name.length
		array[count] = []
		array[count][0] = file_name
		array[count][1] = len/2.round
		count += 1
	end

end
array = array.sort_by {|el| el[0]}
CSV.open("results.csv", "w") do |csv|

	array.each do |element|
		
		csv << element
		
	end

end
