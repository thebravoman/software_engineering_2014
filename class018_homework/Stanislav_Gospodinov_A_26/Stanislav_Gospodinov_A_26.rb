require_relative "CSVWriter.rb"
require_relative "XMLWriter.rb"
require_relative "HTMLWriter.rb"
require_relative "JSONWriter.rb"
require "yaml"
thing = YAML.load_file('config.yml')
timer = Time.now
list = Hash.new { |hash, key| hash[key] = Array.new(26, 0)}
deadlines = thing["deadlines"]
folders = thing["folders"]
def func (hash, adress, colonum, deadline)
	count = ARGV[4].to_i if ARGV[3] == "-n"
	i = 0
	Dir.glob("#{ARGV[0]}#{adress}*") do |file|
		system("clear")
		break if i == count
		file_name = file.split('/').last
		if file.split('/').last.split('.').first.split('_').length == 4
			name = file.split('/').last.split('.').first.split('_')[0].capitalize + " " + file.split('/').last.split('.').first.split('_')[1].capitalize
			git_log = `git log --until=#{deadline} #{file}`
			if !git_log.empty?
				hash[name][colonum] = 2
			elsif git_log.empty?
				hash[name][colonum] = 1
			end
		end
		if colonum < 5
		 	hash[name][colonum + 9] = `flog #{file}`.split(":").first.to_s.gsub!(/\s+/, "")
		 	hash[name][colonum + 9 + 8] = `flay #{file} | grep #{file} | wc -l`.split("\n").first	
		else 
			hash[name][colonum + 8] = `flog #{file}`.split(":").first.to_s.gsub!(/\s+/, "")
			hash[name][colonum + 8 + 8 ] = `flay #{file} | grep #{file} | wc -l`.split("\n").first
		end
		i+=1;
	end
end
def func0 (hash, adress, colonum, deadline)
	system("clear")
	onTime = 0
	pastTime = 0
	count = ARGV[4].to_i*3 if ARGV[3] == "-n"
	i = 0
	Dir.glob("#{ARGV[0]}#{adress}*/*.*") do |file|
		system("clear")
		break if i == count
		file_name = file.split('/').last
		if file.split('/').last.split('.').first.split('_').length == 3
			name = file.split('/').last.split('.').first.split('_')[0].capitalize + " " + file.split('/').last.split('.').first.split('_')[1].capitalize 
			git_log = `git log --until=#{deadline} #{file}`
			if !git_log.empty? and hash.has_key?("#{name}")
				onTime += 1
			elsif git_log.empty? and hash.has_key?("#{name}")
				pastTime += 1
			end
			if onTime >= 3
				hash[name][colonum] = 2
				count-=1
			elsif onTime+pastTime >= 3 
				hash[name][colonum] = 1
				count-=1
			end	
		end
	end
	count = ARGV[4].to_i*3 if ARGV[3] == "-n"
	Dir.glob("#{ARGV[0]}#{adress}*.*") do |file|
		system("clear")
		break if i == count
		file_name = file.split('/').last
		if file.split('/').last.split('.').first.split('_').length == 3
			name = file.split('/').last.split('.').first.split('_')[0].capitalize + " " + file.split('/').last.split('.').first.split('_')[1].capitalize 
			git_log = `git log --until=#{deadline} #{file}`
			if !git_log.empty? and hash.has_key?("#{name}")
				onTime += 1
			elsif git_log.empty? and hash.has_key?("#{name}")
				pastTime += 1
			end
			if onTime >= 3
				hash[name][colonum] = 2
				count-=1
			elsif onTime+pastTime >= 3 
				hash[name][colonum] = 1
				count-=1
			end	
		end
		count-=1
	end
end

func(list, folders[1], 1, deadlines[1])
func(list, folders[2], 2, deadlines[2])
func(list, folders[3], 3, deadlines[3])
func(list, folders[5], 5, deadlines[5])
func(list, folders[6], 6, deadlines[6])
func(list, folders[7], 7, deadlines[7])
func(list, folders[8], 8, deadlines[8])
func(list, folders[9], 9, deadlines[9])
func0(list, folders[0], 0, deadlines[0])
list.delete_if { |k, v| k.nil? }
list = Hash[list.sort_by{|k, v| k}]
timer = Time.now - timer
if ARGV[1] = "-o" 
	case ARGV[2]
		when "csv"
 			writer=CSVWriter.new
		when "xml"
   			writer=XMLWriter.new
   		when "json"
   			writer=JSONWriter.new
   		when "html"
   			writer=HTMLWriter.new
   		when "svg"
   			#
	end
end

writer.write(list, timer)