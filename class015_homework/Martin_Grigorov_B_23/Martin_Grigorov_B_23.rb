require_relative "csv_writer.rb"
require_relative "html_writer.rb"
require_relative "json_writer.rb"
require_relative "xml_writer.rb"
require_relative "svg_writer.rb"
start_time = Time.now
folder_name = ["class002_homework", "class003_homework","class004","class009_homework","class012_homework","class014_homework"]
result = Hash.new{|hash, key| hash[key] = [0,0,0,0,0,0,0,"-","-","-","-","-","-","-","-","-","-"]}
flog_hash = Hash.new
folder = 0
prg_count = 0
n = 0
line_count = 0
red_count = 0
name_array = Array.new
red_array = Array.new

p=Array.new
p[0]=0
p[1]=0
p[2]=0
p[3]=0
p[4]=0
p[5]=0
p[6]=0

def flog_def file,result,name,flog_count
	flog = `flog #{file} --continue`.split(":").first.to_s.gsub!(/\s+/, "")
	result[name][flog_count] = flog

end

def flay_def file,result,first_name,name,flay_count
	flay = `flay #{file} | grep #{first_name} | wc -l`.to_i
	result[name][flay_count] = flay
end
Dir.glob(ARGV[0]+"vhodno_nivo/**/*.*").each do |file|
	short_file = file.split(/\//).last
	if short_file.include? "_"
		first_name = short_file.split(/_/).first.capitalize
		last_name = short_file.split(/_/, 2).last.split("_").first.capitalize
		name = first_name + ',' + last_name
		log = `git log --until=17.09.2014:20:00:00 #{file}`
		if !log.empty?
			name_array[n] = name
		elsif log.empty?
			name_array[n] = name + '1'
		end
		n += 1
	end
end
name_array.sort!
for element in 0..name_array.size-1
	#if i != name_array.size
		if name_array[element] == name_array[element+1]
			prg_count += 1
		end
		if prg_count == 2
			if name_array[element].include? ('1')
				name_array[element] = name_array[element].delete("1")
				result[name_array[element]][folder] = 1		
				p[0]+=1;
			elsif !name_array[element].include? ('1')
				result[name_array[element]][folder] = 2
			end
			prg_count = 0
		end
	#end
end

folder = 1

for i in 0..5
	if i != 3
		Dir.glob(ARGV[0]+"#{folder_name[i]}/**/*_*_*_*.rb").each do |file|
			short_file = file.split(/\//).last
			first_name = short_file.split(/_/).first.capitalize
			last_name = short_file.split(/_/, 2).last.split("_").first.capitalize
			name = first_name + ',' + last_name
				if i == 0
					log = `git log --until=22.09.2014:20:00:00 #{file}`
					flay_def file,result,first_name,name,folder+11
					flog_def file,result,name,folder+6
				elsif i == 1
					log = `git log --until=24.09.2014:20:00:00 #{file}`
					flog_def file,result,name,folder+6
					flay_def file,result,first_name,name,folder+11
				elsif i == 2
					log = `git log --until=29.09.2014:20:00:00 #{file}`
					flog_def file,result,name,folder+6
					flay_def file,result,first_name,name,folder+11
				elsif i == 4
					log = `git log --until=10.11.2014:20:00:00 #{file}`
					flog_def file,result,name,folder+5
					flay_def file,result,first_name,name,folder+10
				elsif i == 5
					log = `git log --until=13.11.2014:06:00:00 #{file}`
					flog_def file,result,name,folder+5
					flay_def file,result,first_name,name,folder+10
				end
				if !log.empty?
					result[name][folder] = 2
				elsif log.empty?
					result[name][folder] = 1
					p[i+1]+=1
				end
		end
	elsif i == 3
		name_list = File.open(ARGV[0]+"class009_homework/project_to_names.csv")
		file_read = name_list.readlines
		for i in 0..file_read.length - 1
			line = file_read[line_count]
			teamname_name_array = line.split(",")
			names = teamname_name_array[1].split(" ")
			first_name = names[0]; last_name = names[1]
			name = first_name + "," + last_name
			team = teamname_name_array[0]
			if File.exist? "#{ARGV[0]}class009_homework/#{team}.pdf"
				log = `git log --until=27.10.2014:20:00:00#{ARGV[0]}class009_homework/#{team}.pdf`
				if !log.empty?
					result[name][folder] = 2
				elsif log.empty?
					result[name][folder] = 1
					p[4]+=1
				end
			end
			line_count += 1
		end
	end
	folder += 1
end
cfft=Time.now-start_time
cff = "time=",cfft,"VH","002","003","004","009","012","014","g2","g3","g4","g12","g14","y2","y3","y4","y12","y14" 
if ARGV[1] == "-o"
		case
		when ARGV[2] == "csv"
			writer = CSVWriter.new
			writer.write result, cff
		when ARGV[2] == "html"
			writer = HTMLWriter.new
			writer.write result,cfft
		when ARGV[2] == "xml"
			writer = XMLWriter.new
			writer.write result,cfft #Do
		when ARGV[2] == "json"
			writer = JSONWriter.new
			writer.write result,cfft #Do

		when ARGV[2] == "svg"
			writer = SVGWriter.new
			writer.write p
		else 
			puts "invalid format"
		end
end

