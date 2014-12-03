require_relative "csv_writer.rb"
require_relative "html_writer.rb"
require_relative "json_writer.rb"
require_relative "xml_writer.rb"
require_relative "svg_writer.rb"
require 'yaml'

start_time = Time.now

thing = YAML.load_file('config.yml').keys
thing2 = YAML.load_file('config.yml')
result = Hash.new{|hash, key| hash[key] = thing2["ini_config"].values}
folder = 0
prg_count = 0
n = 0
name_array = Array.new

p = Array.new(9,0)

def flog_def file,result,name,flog_count
	flog = `flog #{file} --continue`.split(":").first.to_s.gsub!(/\s+/, "")
	result[name][flog_count] = flog
end

def flay_def file,result,first_name,name,flay_count
	flay = `flay #{file} | grep #{first_name} | wc -l`.to_i
	result[name][flay_count] = flay
end

Dir.glob(ARGV[0]+"vhodno_nivo/**/*_*_*.*").each do |file|
	short_file = file.split(/\//).last
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
name_array.sort!
for element in 0..name_array.size-1
		if name_array[element] == name_array[element+1]
			prg_count += 1
		end
		if prg_count == 2
			if name_array[element].include? ('1')
				name_array[element] = name_array[element].delete("1")
				result[name_array[element]][folder] = 1
				p[0]+=1
			elsif !name_array[element].include? ('1')
				result[name_array[element]][folder] = 2
			end
			prg_count = 0
		end
end

folder = 1

thing.delete("ini_config")

thing.each do |asd|
	if asd != "class009"
		Dir.glob(ARGV[0]+"#{thing2[asd]["folder"]}").each do |file|
			short_file = file.split(/\//).last
			if short_file.split("_").length == 4
				first_name = short_file.split(/_/).first.capitalize
				last_name = short_file.split(/_/, 2).last.split("_").first.capitalize
				name = first_name + ',' + last_name
				log = `git log #{thing2[asd]["date"]} #{file}`	
				if !log.empty?
					result[name][folder] = 2
				elsif log.empty?
					result[name][folder] = 1
						p[folder]+=1
				end
				flog_def(file,result,name,thing2[asd]["flog_argument"])
				flay_def(file,result,first_name,name,thing2[asd]["flay_argument"])
			end
		end
	elsif asd == "class009"
		name_list = File.open(ARGV[0]+"#{thing2[asd]["folder"]}")
		file_read = name_list.readlines
		file_read.each do |line|		
			teamname_name_array = line.split(",")
			names = teamname_name_array[1].split(" ")
			first_name = names[0]; last_name = names[1]
			name = first_name + "," + last_name
			team = teamname_name_array[0]
			if File.exist? "#{ARGV[0]}class009_homework/#{team}.pdf"
				log = `git log #{thing2[asd]["date"]}#{ARGV[0]}class009_homework/#{team}.pdf`
				if !log.empty?
					result[name][folder] = 2
				elsif log.empty?
					result[name][folder] = 1
					p[4]+=1
				end
			end
		end
	end
	folder += 1
end

result.keys.sort.each { |k| result[k] = result.delete k }

end_time=Time.now-start_time

if ARGV[1] == "-o"
		case ARGV[2]
			when "csv"
				writer = CSVWriter.new
				writer.write result, end_time, thing2
			when "html"
				writer = HTMLWriter.new
				writer.write result, end_time
			when "xml"
				writer = XMLWriter.new
				writer.write result, end_time
			when "json"
				writer = JSONWriter.new
				writer.write result, end_time

			when "svg"
				writer = SVGWriter.new
				writer.write p, end_time
			else 
				puts "invalid format"
		end
end
