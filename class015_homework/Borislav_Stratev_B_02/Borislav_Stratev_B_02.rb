require_relative "csv_writer.rb"
require_relative "json_writer.rb"
require_relative "xml_writer.rb"
time_start =Time.now
def putones (d,h,j,l,p)
	Dir.glob(d) do |f|
		flog = `flog #{f} --continue`
		f = f.split(/\//).last
		fn = f.split(/_/)[0]
		ln = f.split(/_/)[1]
		flay = `flay *rb | grep #{fn} | wc-1`
		n = fn.capitalize + ' ' + ln.capitalize
		if h.has_key?(n) == false
			h[n] = Array.new
		end
		if flog != "" then 
			flog=flog.split(/\n/).first.split(/:/).first.to_f
		end
		h[n][j] = "1"
		h[n][l] = flog
		h[n][p] = flay
	end
end

def puttwos (d,h,j)
	Dir.glob(d) do |f|
		f = f.split(/\//).last
		fn = f.split(/_/)[0]
		ln = f.split(/_/)[1]
		n = fn.capitalize + ' ' + ln.capitalize
		if h.has_key?(n) == false
			h[n] = Array.new
		end
		if h.has_key?(n) == true && h[n][j] == "1"
			h[n][j] = "2"
		end
	end
end
a = Array.new
vh = Array.new
vh_h = Hash.new
h = Hash.new
i = 0
CSV.foreach("#{ARGV[0]}/class009_homework/project_to_names.csv") do |row|
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
s = "#{ARGV[0]}/class002_homework/**/*.rb"
k = 1
q = 7
w = 13
putones(s,h,k,q,w)

s = "#{ARGV[0]}/class003_homework/**/*.rb"
k = 2
q =  q + 1
w = w + 1
putones(s,h,k,q,w)
	
s = "#{ARGV[0]}/class004/**/*.rb"
k = 3
q =  q + 1
w = w + 1
putones(s,h,k,q,w)
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

s = "#{ARGV[0]}/class012_homework/*.*"
k = 5
q =  q + 1
w = w + 1
putones(s,h,k,q,w)
i = 0

s = "#{ARGV[0]}/class014_homework/**/*_*_*_*.rb"
k = 6
q =  q + 1
w = w + 1
putones(s,h,k,q,w)
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
s = "#{ARGV[0]}/class002_homework/**/*.rb"
k = 1
puttwos(s,h,k)

system("git checkout `git rev-list -n 1 --before=2014-09-24-20:00:01 master`")
s = "#{ARGV[0]}/class003_homework/**/*.rb"
k = 2
puttwos(s,h,k)

system("git checkout `git rev-list -n 1 --before=2014-09-29-20:00:01 master`")
s = "#{ARGV[0]}/class004/**/*.rb"
k = 3
puttwos(s,h,k)
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
s = "#{ARGV[0]}/class012_homework/*.rb"
k = 5
puttwos(s,h,k)

system("git checkout `git rev-list -n 1 --before=2014-11-20-06:00:01 master`")
s = "#{ARGV[0]}/class014_homework/**/*_*_*_*.rb"
k = 6
puttwos(s,h,k)


i = 0

for i in 0..6 do
	h.each_key do |k|
		for j in 0..6 do
			if h[k][j] == nil
				h[k][j] = "0"
			end
		end
	end
end	
i = 0	
h.delete_if{|k,v| k == nil}
puts "Time: #{Time.now - time_start}"
if ARGV[1] == "-o"
  case ARGV[2]
  when "csv"
    writer = CSVWriter.new
  when "xml"
    writer = XMLWriter.new
  when "json"
    writer = JSONWriter.new
end
writer.write h
