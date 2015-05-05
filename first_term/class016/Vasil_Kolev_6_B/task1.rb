require 'csv'

csv = CSV.read("this_is_the_csv_file.csv")
result = `#{csv[0][0]}`
results = Array.new
results[0] = csv[0][0]
results[1] = result

CSV.open('results.csv', 'w') do |write|
	write << results
end
