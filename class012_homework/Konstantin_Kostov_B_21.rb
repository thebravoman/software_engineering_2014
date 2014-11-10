require 'csv'
classes = " "," ","VH","002","003","004","009","012"

result = Hash.new{|hash, key| hash[key] = [0,0,0,0,0]}
folder = 0


name_array = Array.new
Dir.glob(ARGV[0]+"vhodno_nivo/**/*.*").each do |file|
short_file = file.split(/\//).last
if short_file.scan("_").length == 2
first_name = short_file.split(/_/).first.capitalize
last_name = short_file.split(/_/, 2).last.split("_").first.capitalize
name = first_name + ',' + last_name
log = `git log --until=Sep--17--2014--20:00:00 #{file}`
if !log.empty?
result[name][folder] = 2
elsif log.empty?
result[name][folder] = 1
end

end
end

folder = 1
Dir.glob(ARGV[0]+"class002_homework/*.*").each do |file|
short_file = file.split(/\//).last
if short_file.include? ("_")
first_name = short_file.split(/_/).first.capitalize
last_name = short_file.split(/_/, 2).last.split("_").first.capitalize
name = first_name + ',' + last_name
log = `git log --until=Sep--22--2014--20:00:00 #{file}`
if !log.empty?
result[name][folder] = 2
elsif log.empty?
result[name][folder] = 1
end
end
end
folder = 2

Dir.glob(ARGV[0]+"class003_homework/*.*").each do |file|
short_file = file.split(/\//).last
if short_file.include? ("_")
first_name = short_file.split(/_/).first.capitalize
last_name = short_file.split(/_/, 2).last.split("_").first.capitalize
name = first_name + ',' + last_name

log = `git log --until=Sep--24--2014--20:00:00 #{file}`
if !log.empty?
result[name][folder] = 2
elsif log.empty?
result[name][folder] = 1
end
end
end
folder = 3

Dir.glob(ARGV[0]+"class004/*.*").each do |file|
short_file = file.split(/\//).last
if short_file.include? ("_")
first_name = short_file.split(/_/).first.capitalize
last_name = short_file.split(/_/, 2).last.split("_").first.capitalize
name = first_name + ',' + last_name
log = `git log --until=Sep--29--2014--20:00:00 #{file}`
if !log.empty?
result[name][folder] = 2
elsif log.empty?
result[name][folder] = 1
end
end
end

CSV.open("results2.csv","w") do |csv|
csv << classes
result.keys.each do |key|
key_split = key.split(",")
csv << [key_split,result[key]].flatten
end
end
