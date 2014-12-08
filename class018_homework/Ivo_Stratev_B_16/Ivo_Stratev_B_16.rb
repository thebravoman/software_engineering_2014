require_relative "csv_writer.rb"
require_relative "json_writer.rb"
require_relative "xml_writer.rb"
require_relative "html_writer.rb"
require_relative "svg_writer.rb"
require "yaml"
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

def check_n
	counter = 0
	if ARGV[3] == "-n"
		if counter == ARGV[4].to_i
			return true
		end
		counter += 1
		return false
	end
	return false
end

def eval (a,d,h,j,g,y)
	Dir.glob("#{ARGV.first}/#{d}") do |f|
		break if check_n
		flag = is_it_on_time a,f
		n = get_name f
		fn = n.split(/\ /).first
		a = `flay #{f} | grep #{n} | wc -l`.to_i
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
conf = Hash.new
conf = YAML.load_file("config.yml")
conf.each do |k,v|
	eval(v[0],v[1],h,v[2],v[3],v[4])
	
end

CSV.foreach(ARGV.first+"/class009_homework/project_to_names.csv") do |row|
	Dir.glob("#{ARGV[0]}/class009_homework/**/*.pdf") do |f|
		break if check_n
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
	break if check_n
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
