require "yaml"
require 'csv'

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

def eval time_stamp,dir,hash,position_in_hash_for_name
	Dir.glob("#{ARGV.first}/#{dir}") do |file|
		flag = is_it_on_time time_stamp, file
		name = get_name file
		first_name = name.split(/ /).first
		if name != nil
			if hash.has_key?(name) == false
				hash[name] = Array.new
			end
			if flag == false
				hash[name][position_in_hash_for_name] = "2"
			else
				hash[name][position_in_hash_for_name] = "1"
			end

		end
	end	
end

def projects  csv_file,dir,stamp,hash
	index = 0
	position = 4
	CSV.foreach("#{ARGV.first}/#{csv_file}") do |row|
		Dir.glob("#{ARGV.first}/#{dir}") do |file|
			flag = is_it_on_time stamp,file
			name = file.split(/\//).last.split(/\./).first
			if row[0] == name
				if hash.has_key?(row[1]) == false
					hash[row[1]] = Array.new
				end
				if flag == false
					hash[row[1]][position] = "2"
				else
					hash[row[1]][position] = "1"
				end
			end
			
		end	
	end
end

def entry_lv dir,stamp,hash
	entry_lv_ary = Array.new
	index = 0
	position = 0
	Dir.glob("#{ARGV.first}/#{dir}") do |entry_lv_file|
		flag = is_it_on_time stamp,entry_lv_file
		name = get_name entry_lv_file
		entry_lv_ary[index] = name
		index = index +1
		if hash.has_key?(name) == false
			hash[name] = Array.new
		end
		if entry_lv_ary.count(name) > 2	
			if flag == false
				hash[name][position] = "2"
			else
				hash[name][position] = "1"
			end
		end
	end
end

def putzeros range_of_hash,hash
	for homeworks_counter in 0..range_of_hash do
		hash.each_key do |key|
			for range_of_hash_value in 0..range_of_hash do
				if hash[key][range_of_hash_value] == nil
					hash[key][range_of_hash_value] = "0"
				end
			end
		end
	end
end

def board hash,time
	key = ('@'+' '+"#{time}").to_s
	hash[key] = ["Vh", "002", "003", "004", "009", "012"]
end

def delete hash
	hash.delete_if{|key,val| key == nil || val == nil}
	hash.delete_if{|key,val| key == "Run Them"}
	hash.delete_if{|key,val| key.is_a? Array}
end

class CSVWriter
	def write h,no_need_of_this_arg
		File.open("results_Borislav_Stratev_B_2.csv","w") do |csv|
			h.keys.sort.each do |k, v|
				csv << [k.split(/\ /)[0], k.split(/\ /)[1],h[k][0],h[k][1],h[k][2],h[k][3],h[k][4],h[k][5]].flatten.to_csv
			end
			csv.close
		end
	end
end

def write_it hash, time		
	writer = CSVWriter.new		
	writer.write hash, time
end
time_start =Time.now

eval_hash = Hash.new
configuration_hash = Hash.new
configuration_hash = YAML.load_file("config.yml")
configuration_hash.each do |key,value|
	eval(value[0],value[1],eval_hash,value[2])
	
end

csv_file = "class009_homework/project_to_names.csv"
dir = "class009_homework/**/*.pdf"
stamp = "--until=2014.10.27.20:00:01"
projects  csv_file, dir, stamp, eval_hash

dir = "vhodno_nivo/**/*.*"
stamp = "--until=2014.09.17.20:00:01"
entry_lv dir,stamp,eval_hash

range = 5
putzeros range,eval_hash
	
delete eval_hash

time = (Time.now - time_start).to_s

board eval_hash, time
write_it eval_hash, time
