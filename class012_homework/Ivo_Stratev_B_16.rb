require 'csv'
a = Array.new
vh = Array.new
vh_h = Hash.new
h = Hash.new

i = 0
CSV.foreach("../class009_homework/project_to_names.csv") do |row|
	a[i] = row
	i = i +1
end
i = 0
system("git checkout `git rev-list -n 1 --before=2014-11-27-20:00:01 master`")
Dir.glob("#{ARGV[0]}/vhodno_nivo/**/*.*") do |vh_f|
	vh_f = vh_f.split(/\//).last
	if (vh_f.include? "Sum") == false and (vh_f.include? "Arr") == false and (vh_f.include? "Cos") == false and (vh_f.include? "Fact") == false and (vh_f.include? "Fib") == false and (vh_f.include? "Prob") == false
		fn = vh_f.split(/_/)[0]
		ln = vh_f.split(/_/)[1]
		if fn != nil && ln !=nil
			n = fn.capitalize + ' ' + ln.capitalize
			vh[i] = n
			i = i +1
		end
		h[n] = Array.new
		if vh.count(n) > 2
			h[n][0] = "1"
		else
			h[n][0] = "0"
		end	
	end		
end
i = 0
Dir.glob("#{ARGV[0]}/class002_homework/**/*.rb") do |f|
	f = f.split(/\//).last
	fn = f.split(/_/)[0]
	ln = f.split(/_/)[1]
	n = fn.capitalize + ' ' + ln.capitalize
	if h.has_key?(n) == false 
		h[n] = Array.new
	end
	h[n][1] = "1"
end

Dir.glob("#{ARGV[0]}/class003_homework/**/*.rb") do |f|
	f = f.split(/\//).last
	fn = f.split(/_/)[0]
	ln = f.split(/_/)[1]
	n = fn.capitalize + ' ' + ln.capitalize
	if h.has_key?(n) == false
		h[n] = Array.new
	end
	h[n][2] = "1"
end
	
Dir.glob("#{ARGV[0]}/class004/**/*.rb") do |f|
	f = f.split(/\//).last
	fn = f.split(/_/)[0]
	ln = f.split(/_/)[1]
	n = fn.capitalize + ' ' + ln.capitalize
	if h.has_key?(n) == false
		h[n] = Array.new
	end
	h[n][3] = "1"
end
i = 0
Dir.glob("#{ARGV[0]}/class009_homework/**/*.*") do |f|
	f = f.split(/\//).last
	n = f.split(/\./).first
	for i in 0..a.size - 1  do
		if a[i][0] == n
			h[a[i][1]][4] = "1"
		end
		i = i + 1
	end
end

Dir.glob("#{ARGV[0]}/class012_homework/**/*.*") do |f|
	f = f.split(/\//).last
	fn = f.split(/_/)[0]
	ln = f.split(/_/)[1]
	if fn != nil && ln !=nil
		n = fn.capitalize + ' ' + ln.capitalize
	end
	if h.has_key?(n) == false
		h[n] = Array.new
	end
	h[n][5] = "1"
end
i = 0

system("git checkout `git rev-list -n 1 --before=2014-09-17-20:00:01 master`")
Dir.glob("#{ARGV[0]}/vhodno_nivo/**/*.*") do |vh_f|
	vh_f = vh_f.split(/\//).last
	if (vh_f.include? "Sum") == false and (vh_f.include? "Arr") == false and (vh_f.include? "Cos") == false and (vh_f.include? "Fact") == false and (vh_f.include? "Fib") == false and (vh_f.include? "Prob") == false
		fn = vh_f.split(/_/)[0]
		ln = vh_f.split(/_/)[1]
		if fn != nil && ln !=nil
			n = fn.capitalize + ' ' + ln.capitalize
			vh[i] = n
			i = i +1
		end
		if vh.count(n) > 2 
			if h.has_key?(n) == true && h[n][0] == "1"
				h[n][0] = "2"
			end
		end	
	end		
end

system("git checkout `git rev-list -n 1 --before=2014-09-22-20:00:01 master`")
Dir.glob("#{ARGV[0]}/class002_homework/**/*.rb") do |f|
	f = f.split(/\//).last
	fn = f.split(/_/)[0]
	ln = f.split(/_/)[1]
	n = fn.capitalize + ' ' + ln.capitalize
	if h.has_key?(n) == false
		h[n] = Array.new
	end
	if h.has_key?(n) == true && h[n][1] == "1"
		h[n][1] = "2"
	end
end

system("git checkout `git rev-list -n 1 --before=2014-09-24-20:00:01 master`")
Dir.glob("#{ARGV[0]}/class003_homework/**/*.rb") do |f|
	f = f.split(/\//).last
	fn = f.split(/_/)[0]
	ln = f.split(/_/)[1]
	n = fn.capitalize + ' ' + ln.capitalize
	if h.has_key?(n) == false
		h[n] = Array.new
	end
	if h.has_key?(n) == true && h[n][2] == "1"
		h[n][2] = "2"
	end
end

system("git checkout `git rev-list -n 1 --before=2014-09-29-20:00:01 master`")
Dir.glob("#{ARGV[0]}/class004/**/*.rb") do |f|
	f = f.split(/\//).last
	fn = f.split(/_/)[0]
	ln = f.split(/_/)[1]
	n = fn.capitalize + ' ' + ln.capitalize
	if h.has_key?(n) == false
		h[n] = Array.new
	end
	if h.has_key?(n) == true && h[n][3] == "1"
		h[n][3] = "2"
	end
end
i = 0
system("git checkout `git rev-list -n 1 --before=2014-10-27-20:00:01 master`")
Dir.glob("#{ARGV[0]}/class009_homework/**/*.*") do |f|
	f = f.split(/\//).last
	n = f.split(/\./).first
	for i in 0..a.size - 1  do
		if a[i][0] == n
			if h.has_key?(a[i][1]) == true && h[a[i][1]][4] == "1"
				h[a[i][1]][4] = "2"
			end
		end
		i = i + 1
	end
end

system("git checkout `git rev-list -n 1 --before=2014-11-10-20:00:01 master`")
Dir.glob("#{ARGV[0]}/class012_homework/**/*.*") do |f|
	f = f.split(/\//).last
	fn = f.split(/_/)[0]
	ln = f.split(/_/)[1]
	if fn != nil && ln !=nil
		n = fn.capitalize + ' ' + ln.capitalize
	end
	if h.has_key?(n) == false
		h[n] = Array.new
	end
	if h.has_key?(n) == true && h[n][5] == "1"
		h[n][5] = "2"
	end
end

i = 0

for i in 0..5 do
	h.each_key do |k|
		for j in 0..5 do
			if h[k][j] == nil
				h[k][j] = "0"
			end
		end
	end
end	
i = 0	
h.delete_if{|k,v| k == nil}
CSV.open("results_Ivo_Stratev_B_16.csv", "w") do |csv|
	h.keys.each  do |k|
		tmp1 = k.split(/\ /)[0]
		tmp2 = k.split(/\ /)[1]
		csv <<[tmp1,tmp2,h[k][0],h[k][1],h[k][2],h[k][3],h[k][4],h[k][5]]
	end
end
i = 0
CSV.foreach("./results_Ivo_Stratev_B_16.csv") do |row|
	a[i] = row
	i = i +1
end
a = a.sort
b = Array.new
CSV.open("results_Ivo_Stratev_B_16.csv","w") do |csv|
	csv << [" ", " ", "Vh", "002", "003", "004", "009", "012", "\n"]
	a.each do |element|
		csv << element
	end
end
