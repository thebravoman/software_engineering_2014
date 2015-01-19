require_relative "csv_writer.rb"
require_relative "json_writer.rb"
require_relative "xml_writer.rb"
require_relative "html_writer.rb"
require_relative "svg_writer.rb"
time_start =Time.now
system("git checkout `git rev-list -n 1 --before=now master`")

def putones (d,h,j,g,y)
	Dir.glob(d) do |f|

		fl = f
		f = f.split(/\//).last
		fn = f.split(/_/)[0]
		ln = f.split(/_/)[1]
		if fn != nil && ln != nil
			n = fn.capitalize + ' ' + ln.capitalize
			a = `flay #{fl} | grep #{fn} | wc -l`.to_i
			b =`flog #{fl}`.to_i
		end

		if h.has_key?(n) == false
			h[n] = Array.new
		end

		if h[n][j] != "2"
			h[n][j] = "1"
		end
	
	h[n][y] = a.to_s
	h[n][g] = b.to_s
	end

end

def puttwos (d,h,j)
	Dir.glob(d) do |f|
		f = f.split(/\//).last
		fn = f.split(/_/)[0]
		ln = f.split(/_/)[1]
		if fn != nil && ln != nil
			n = fn.capitalize + ' ' + ln.capitalize
		end

		if h.has_key?(n) == false
			h[n] = Array.new
		end
		h[n][j] = "2"
	end
end

a = Array.new
i = 0
CSV.foreach("#{ARGV[0]}/class009_homework/project_to_names.csv") do |row|
	a[i] = row
	i = i +1
end

h = Hash.new

system("git checkout `git rev-list -n 1 --before=2014-09-22-20:00:01 master`")
s = "#{ARGV[0]}/class002_homework/*.rb"
k = 1
puttwos(s,h,k)

system("git checkout `git rev-list -n 1 --before=2014-09-24-20:00:01 master`")
s = "#{ARGV[0]}/class003_homework/*.rb"
k = 2
puttwos(s,h,k)

system("git checkout `git rev-list -n 1 --before=2014-09-29-20:00:01 master`")
s = "#{ARGV[0]}/class004/*.rb"
k = 3
puttwos(s,h,k)

system("git checkout `git rev-list -n 1 --before=2014-11-10-20:00:01 master`")
s = "#{ARGV[0]}/class012_homework/*_*_*_*.rb"
k = 5
puttwos(s,h,k)

system("git checkout `git rev-list -n 1 --before=2014-11-20-06:00:01 master`")
s = "#{ARGV[0]}/class014_homework/**/*_*_*_*.rb"
k = 6
puttwos(s,h,k)

i = 0
system("git checkout `git rev-list -n 1 --before=2014-10-27-20:00:01 master`")
Dir.glob("#{ARGV[0]}/class009_homework/**/*.*") do |f|
	f = f.split(/\//).last
	n = f.split(/\./).first
	for i in 0..a.size - 1  do
		if a[i][0] == n
			h[a[i][1]][4] = "2"
		end
		i = i + 1
	end
end

vh = Array.new
i = 0
system("git checkout `git rev-list -n 1 --before=2014-09-17-20:00:01 master`")
Dir.glob("#{ARGV[0]}/vhodno_nivo/**/*.*") do |vh_f|
	vh_f = vh_f.split(/\//).last
	fn = vh_f.split(/_/)[0]
	ln = vh_f.split(/_/)[1]
	if fn != nil && ln != nil
		n = fn.capitalize + ' ' + ln.capitalize
		vh[i] = n
		i = i +1
	end

	if vh.count(n) > 2
		h[n][0] = "2"
	end			
end

system("git checkout `git rev-list -n 1 --before=now master`")

s = "#{ARGV[0]}/class002_homework/*.rb"
k = 1
g = 7
y = g + 5
putones(s,h,k,g,y)

s = "#{ARGV[0]}/class003_homework/*.rb"
k = 2
g = g + 1
y = y + 1
putones(s,h,k,g,y)

s = "#{ARGV[0]}/class004/*.rb"
k = 3
g = g + 1
y = y + 1
putones(s,h,k,g,y)

s = "#{ARGV[0]}/class012_homework/*_*_*_*.rb"
k = 5
g = g + 1
y = y + 1
putones(s,h,k,g,y)

s = "#{ARGV[0]}/class014_homework/**/*_*_*_*.rb"
k = 6
g = g + 1
y = y + 1
putones(s,h,k,g,y)

i = 0 
Dir.glob("#{ARGV[0]}/class009_homework/**/*.*") do |f|
	f = f.split(/\//).last
	n = f.split(/\./).first
	for i in 0..a.size - 1  do
		if a[i][0] == n
			if h[a[i][1]][4] != "2"
				h[a[i][1]][4] = "1"
			end
		end
		i = i + 1
	end
end

i = 0 
Dir.glob("#{ARGV[0]}/vhodno_nivo/**/*.*") do |vh_f|

	vh_f = vh_f.split(/\//).last
	fn = vh_f.split(/_/)[0]
	ln = vh_f.split(/_/)[1]
	if fn != nil && ln != nil
		n = fn.capitalize + ' ' + ln.capitalize
		vh[i] = n
		i = i +1
	end

	if  vh.count(n) > 2 &&  h[n][0] == nil
		h[n][0] = "1"
	end			
end

for i in 0..16 do
	h.each_key do |k|
		for j in 0..16 do
			if h[k][j] == nil
				h[k][j] = "0"
			end
		end
	end
end	
h.delete_if{|k,v| k == nil}
h.delete_if{|k,v| k == "Run Them"}

t = (Time.now - time_start).to_s
if ARGV[1] == "-o"
	case ARGV[2]
		when "csv"
			writer = CSVWriter.new
		when "xml"
			writer = XMLWriter.new
		when "json"
			writer = JSONWriter.new
		when "html"
			writer = HTMLWriter.new
	end
end
writer.write h,t
