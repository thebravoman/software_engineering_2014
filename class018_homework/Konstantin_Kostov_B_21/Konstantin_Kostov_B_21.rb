require_relative "csv_writer.rb"
require_relative "json_writer.rb"
require_relative "xml_writer.rb"
require_relative "html_writer.rb"
require_relative "svg_writer.rb"
require 'csv'
require 'yaml'
time_start=Time.now
classes = file_content= YAML.load_file("info.yml")["classes"]
result = Hash.new{|hash, key| hash[key] = YAML.load_file("info.yml")["result_info"]}
team_names = Array.new
def homework_chek (directory_name,log_info,result,folder,enemy)
Dir.glob(ARGV[0]+"#{directory_name}").each do |file|
short_file_name = file.split(/\//).last
first_name = short_file_name.split(/_/)[0].capitalize
second_name = short_file_name.split(/_/)[1].capitalize
name = first_name + "," + second_name
log = `git log --until=#{log_info} #{file}`
result[name][folder] = 2 if (!log.empty? )
result[name][folder] = 1 if (log.empty? )
if enemy !="*"
result[name][folder + 1] = `flog #{file}`.to_i
flay = `flay #{file} | grep #{first_name} | wc -l `.to_i
result[name][folder + 2] = flay
end
end
return result
end
def homework_chek_009 (directory_name,log_info,cop,fire,result,folder)
team_names = CSV.read(ARGV[0]+"#{fire}""/""#{cop}")
Dir.glob(ARGV[0]+"#{directory_name}").each do |file|
name = file.split(/\//).last.split(".").first
team_members = 0
line = 0
first_line = false
for counter in 1..team_names.length-1
if team_names[counter][0] == name
line = counter if first_line != true
first_line = true
team_members +=1	
end	
end
log = ` git log --until=#{log_info} #{file}`
for index in 0..team_members-1
final_name = team_names[line + index][1]
final_name = final_name.split(" ")[0] + "," + final_name.split(" ")[1]
result[final_name][folder] = 2 if !log.empty?
result[final_name][folder] = 1 if log.empty?
end	
end
return result
end
$stderr.reopen("/dev/null", "w")
folder = 0
YAML.load_file("info.yml")["homeworks"].each do |yaml|
puts "Working on folder: ", yaml[0]
enemy=yaml[0].split(".").last
if enemy == "pdf"
fire=yaml[0].split("/")[1]
cop = yaml[1].split(",").last
yaml[1] = yaml[1].split(" ")[0]
end
result = homework_chek_009(yaml[0],yaml[1],cop,fire,result,folder) if enemy == "pdf"
result = homework_chek(yaml[0],yaml[1],result,folder,enemy) if enemy != "pdf"
if enemy !="pdf" && enemy !="*"
folder+=3
else
folder+=1
end
end
puts "Time: ",Time.now - time_start

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
else
abort()
end
writer.write(result,classes,folder-3)
end
