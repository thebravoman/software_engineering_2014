require "yaml"
require_relative "functions.rb"
time_start =Time.now

eval_hash = Hash.new
configuration_hash = Hash.new
configuration_hash = YAML.load_file("config.yml")
configuration_hash.each do |key,value|
	eval(value[0],value[1],eval_hash,value[2],value[3],value[4])
	
end

csv_file = "/class009_homework/project_to_names.csv"
dir = "class009_homework/**/*.pdf"
stamp = "--until=2014.10.27.20:00:01"
projects  csv_file, dir, stamp, eval_hash

dir = "vhodno_nivo/**/*.*"
stamp = "--until=2014.09.17.20:00:01"
entry_lv dir,stamp,eval_hash

range = 37
putzeros range,eval_hash
	
delete eval_hash

time = (Time.now - time_start).to_s

board eval_hash, time
write_it eval_hash, time
