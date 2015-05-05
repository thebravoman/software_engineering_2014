require 'csv'
r = -1
m = -1
first = Array.new
first_last = Array.new
Dir.glob(ARGV[0]+"*.rb").each do |script_file|
	fn = script_file.split(/\//).last.split(/_/).first
	ln = script_file.split(/\//).last.split(/_/, 2).last.split(/_/,0).first
	z = 0
	z = 5 if fn.length == 5
	r += 1 if z == 5
	f = 0
	if z == 5 then
	Dir.glob(ARGV[1]+"*.rb").each do |script_file|
		f += 1 if ln == script_file.split(/\//).last.split(/_/, 2).last.split(/_/,0).first
		f += 1 if fn == script_file.split(/\//).last.split(/_/).first
		m += 1 if f == 2
		first_last[m] = "#{ln},#{fn}" if f == 2
	end
	end
end
first_last.uniq!
first_last.sort!

CSV.open("result.csv", "w") do |csv|
	first_last.each do |element|
		csv << element.split(",")
	end
end

