require_relative "CSVWriter.rb"
timer = Time.now
list = Hash.new { |hash, key| hash[key] =  [0, 0, 0, 0, 0, 0, 0, 0]}
folders = Array["vhodno_nivo/", "class002_homework/", "class003_homework/", "class004/", "class009_homework/", "class012_homework/", "class014_homework/", "class015_homework/"]
deadlines = Array["17.09.2014:20:00:00", "22.09.2014:20:00:00", "24.09.2014:20:00:00", "29.09.2014:20:00:00", "27.10.2014:20:00:00", "10.11.2014:20:00:00", "13.11.2014:06:00:00", "20.11.2014:06:00:00"]
def func (hash, adress, colonum, deadline)
	Dir.glob("#{ARGV[0]}#{adress}*") do |file|
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
		 	hash[name][colonum + 7] = `flog #{file} | xargs flog`.split (": flog total").first
		else 
			hash[name][colonum + 6] = `flog #{file} | xargs flog`.split (": flog total").first
		end	
	end
end
def func0 (hash, adress, colonum, deadline)
	onTime = 0
	pastTime = 0
	Dir.glob("#{ARGV[0]}#{adress}*/*.*") do |file|
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
			elsif onTime+pastTime >= 3 
				hash[name][colonum] = 1
			end	
		end
	end
	Dir.glob("#{ARGV[0]}#{adress}*.*") do |file|
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
			elsif onTime+pastTime >= 3 
				hash[name][colonum] = 1
			end	
		end
	end
end

func(list, folders[1], 1, deadlines[1])
func(list, folders[2], 2, deadlines[2])
func(list, folders[3], 3, deadlines[3])
func(list, folders[5], 5, deadlines[5])
func(list, folders[6], 6, deadlines[6])
func(list, folders[7], 7, deadlines[7])
func0(list, folders[0], 0, deadlines[0])

list = Hash[list.sort_by{|k, v| k}]
list.keys.each do |key|
	key = key.split(' ')
end

timer = Time.now - timer

if ARGV[1] = "-o" 
	case ARGV[2]
		when "csv"
 			writer=CSVWriter.new
		when "xml"
   			writer=XMLWRiter.new
	end
end

writer.write(list, timer)