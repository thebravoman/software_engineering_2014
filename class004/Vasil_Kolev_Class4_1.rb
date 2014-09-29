array1 = []
array2 = []

for i in 0..16
	array1[i] = 0
	array2[i] = 0
end

require 'csv'
CSV.foreach('expected_results.csv') do |row|
	array1 = row
end

for i in 0..16
	array1[i] = array1[i].to_i
end

Dir.glob('*_*_[2-9]*').each do |ch|
	s = ch.delete "a-z, _, A-Z, ."
	s = s.to_i
	array2[s-2] = 1
	
end

Dir.glob('*_*_[1][0-8]*').each do |ch|
	s = ch.delete "a-z, _, A-Z, ."
	s = s.to_i
	array2[s-2] = 1
end

puts array1 == array2
