require_relative "csv_writer.rb"
require_relative "json_writer.rb"
require_relative "xml_writer.rb"
require_relative "html_writer.rb"
require_relative "svg_writer.rb"

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

def eval time_stamp,dir,hash,position_in_hash_for_name, position_in_hash_for_flog, position_in_hash_for_flay
	homeworks_counter = 0
	Dir.glob("#{ARGV.first}/#{dir}") do |file|
		flag = is_it_on_time time_stamp, file
		name = get_name file
		r_name = name.gsub(/\ /,'_')
		flay_res = `flay #{file} | grep #{r_name} | wc -l`.to_i
		flog_res =`flog #{file}`.to_i
		if name != nil
			if hash.has_key?(name) == false
				hash[name] = Array.new
			end
			if flag == false
				hash[name][position_in_hash_for_name] = "2"
			else
				hash[name][position_in_hash_for_name] = "1"
			end

			hash[name][position_in_hash_for_flay] = flay_res
			hash[name][position_in_hash_for_flog] = flog_res.to_s
		end

		homeworks_counter = homeworks_counter + 1;
		if ARGV[3] == '-n' && homeworks_counter == ARGV[4].to_i
			return
		end
	end	
end

def projects  csv_file,dir,stamp,hash
	homeworks_counter = 0
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
		homeworks_counter = homeworks_counter + 1;
		if ARGV[3] == '-n' && homeworks_counter == ARGV[4].to_i
			return
		end	
	end
end

def entry_lv dir,stamp,hash
	entry_lv_ary = Array.new
	homeworks_counter = 0
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

		homeworks_counter = homeworks_counter + 1;
		if ARGV[3] == '-n' && homeworks_counter == ARGV[4].to_i
			return
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
	hash[key] = ["Vh", "002", "003", "004", "009", "012","014","015","016","017_1","017_2","018","g002", "g003", "g004", "g009", "g012","g014","g015","g016","g017_1","g017_2","g018","y002", "y003", "y004", "y009", "y012","y014","y015","y016","y017_1","y017_2","y018"]
end

def delete hash
	hash.delete_if{|key,val| key == nil || val == nil}
	hash.delete_if{|key,val| key == "Run Them"}
	hash.delete_if{|key,val| key.is_a? Array}
end

def write_it hash, time
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
	writer.write hash, time
end
