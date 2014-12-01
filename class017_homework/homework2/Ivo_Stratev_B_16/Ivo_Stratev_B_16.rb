require_relative "csv_writer.rb"
require_relative "json_writer.rb"
require_relative "xml_writer.rb"
require_relative "html_writer.rb"
require_relative "svg_writer.rb"

time_start =Time.now

def is_it_on_time time_stamp,file
	`git log #{time_stamp} #{file}`.empty?
end

def get_name file
	name = file.split(/\//).last.split(/_/)
	if name[0] != nil && name[1] != nil
			name = name[0].capitalize + ' ' + name[1].capitalize
	end
	if name != nil
		return name
	end
end

def eval (a,d,h,j,g,y)
	Dir.glob(d) do |f|
		flag = is_it_on_time a,f
		n = get_name f
		fn = n.split(/\ /).first
		a = `flay #{f} | grep #{fn} | wc -l`.to_i
		b =`flog #{f}`.to_i
		if n != nil
			if h.has_key?(n) == false
				h[n] = Array.new
			end

			if flag == true
				h[n][j] = "2"
			else
				h[n][j] = "1"
			end

	
			h[n][y] = a.to_s
			h[n][g] = b.to_s
		end
	end	
end

def putzeros s,h

	for i in 0..s do
		h.each_key do |k|
			for j in 0..s do
				if h[k][j] == nil
					h[k][j] = "0"
				end
			end
		end
	end
end


h = Hash.new
z = Array.new
s = Array.new
k = Array.new
g = Array.new
y = Array.new

z[0] = "--until=2014.09.22.20:00:01"
s[0] = ARGV.first+"/class002_homework/*.rb"
k[0] = 1
g[0] = 7
y[0] = 14

z[1] = "--until=2014.09.24.20:00:01"
s[1] = ARGV.first+"/class003_homework/*.rb"
k[1] = 2
g[1] = 8
y[1] = 15

z[2] = "--until=2014.09.29.20:00:01"
s[2] = ARGV.first+"/class004/*.rb"
k[2] = 3
g[2] = 9
y[2] = 16

z[3] = "--until=2014.11.10.20:00:01"
s[3] = ARGV.first+"/class012_homework/*_*_*_*.rb"
k[3] = 5
g[3] = 10
y[3] = 17

z[4] = "--until=2014.11.20.06:00:01"
s[4] = ARGV.first+"/class014_homework/**/*_*_*_*.rb"
k[4] = 6
g[4] = 11
y[4] = 18

z[5] = "--until=2015.12.02.06:00:01"
s[5] = ARGV.first+"/class017_homework1/**/*_*_*_*.rb"
k[5] = 7
g[5] = 12
y[5] = 19

z[6] = "--until=2015.12.02.06:00:01"
s[6] = ARGV.first+"/class017_homework2/**/*_*_*_*.rb"
k[6] = 8
g[6] = 13
y[6] = 20

for i in 0..z.size - 1 do
	eval(z[i],s[i],h,k[i],g[i],y[i])
end

CSV.foreach(ARGV.first+"/class009_homework/project_to_names.csv") do |row|
	Dir.glob("#{ARGV[0]}/class009_homework/**/*.pdf") do |f|
		a = "--until=2014.10.27.20:00:01"
		flag = is_it_on_time a,f
		n = f.split(/\//).last.split(/\./).first
		for i in 1..row.size - 1  do
			if row[0] == n
				if flag == true
					h[row[1]][4] = "2"
				else
					h[row[1]][4] = "1"
				end
			end
		end
	end
end

vh = Array.new
i = 0
Dir.glob("#{ARGV[0]}/vhodno_nivo/**/*.*") do |vh_f|
	a = "--until=2014.09.17.20:00:01"
	flag = is_it_on_time a,vh_f
	n = get_name vh_f
	vh[i] = n
	i = i +1

	if vh.count(n) > 2
		if flag == true
			h[n][0] = "2"
		else
			h[n][0] = "1"
		end
	end	
end

range = 21
putzeros range,h
	
h.delete_if{|k,v| k == nil || v == nil}
h.delete_if{|k,v| k == "Run Them"}

t = (Time.now - time_start).to_s
k = ('@'+' '+"#{t}").to_s
h[k] = ["Vh", "002", "003", "004", "009", "012","014","g002", "g003", "g004", "g012","g014","g017_1","g017_2","y002", "y003", "y004",  "y012","y014","y017_1","y017_2"]
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
		when "svg"
			writer = SVGWriter.new
	end
end
writer.write h,t
