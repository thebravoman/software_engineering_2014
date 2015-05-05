# encoding: utf-8
require 'yaml'
require_relative 'write_csv.rb'
require_relative 'write_html.rb'
require_relative 'write_svg.rb'
require_relative 'write_xml.rb'
require_relative 'write_json.rb'

def folder_needs_analysis?(dir)
	return true if dir != 0 and dir != 9 and dir != 172
end

start = Time.now

if ARGV[0] == nil
	puts "Expected: ruby Stanislav_Iliev_B_26.rb {path to repo} -o {output format}"
	exit 1
end

if ARGV[0][-1] != "/"
	ARGV[0] += "/"
end

max_students = -1
if ARGV[3] == "-n"
	max_students = ARGV[4].to_i 
end


directories = YAML.load_file("config.yaml")

results = Hash.new{|hash,key| hash[key] = Array.new(directories.size) {0}}
vhodno = Hash.new{|hash,key| hash[key] = [0,0]}
class009 = Hash.new{|hash,key| hash[key] = []}

File.open("#{ARGV[0]}class009_homework/project_to_names.csv", "r").readlines.drop(1).each do |line|
	class009[line.chomp.split(",")[0]] << line.chomp.split(",")[1]
end

folder = 0
fl = directories.size #position for flog and flay

directories.each do |dir, directory_and_deadline|
	puts "Checking #{directory_and_deadline[0].split("/").first} (#{folder+1}/#{directories.length})"
	count_students = 0
	directory = directory_and_deadline[0]
	deadline = directory_and_deadline[1]
	Dir.glob("#{ARGV[0]}#{directory}").each do |script_file|
		break if count_students == max_students
		count_students += 1
		first_name = script_file.split(/\//).last.split("_").first.capitalize
		last_name = script_file.split(/\//).last.split("_",2).last.split("_").first.capitalize
		name = "#{first_name} #{last_name}"
		if dir == 9
			name = script_file.split(/\//).last.split(/\./).first
		end
		
		result = `git log --until=#{deadline} #{script_file.gsub(/(?=[ -'])/, '\\')}`
		if result != "" and result != nil
			if dir == 0
				vhodno["#{name}"][0] += 1
				if vhodno["#{name}"][0] != 3
					next
				end
			end
			if dir == 9
				class009["#{name}"].each do |student|
					results["#{student}"][folder] = 2
				end
				next
			end

			results["#{name}"][folder] = 2
		else
			if dir == 0
				vhodno["#{name}"][1] += 1
				if vhodno["#{name}"][1] + vhodno["#{name}"][0] != 3
					next
				end
			end
			if dir == 9
				class009["#{name}"].each do |student|
					results["#{student}"][folder] = 1
				end
				next
			end

			results["#{name}"][folder] = 1
		end
		
		if folder_needs_analysis?(dir)
			flog = `flog #{script_file} --continue 2>/dev/null`
			flay = `flay #{script_file} 2>/dev/null | grep #{script_file.split(/\//).last.split("_").first.capitalize} | wc -l`

			if flog != "" then
				flog = flog.split(/\n/).first.split(/:/).first.to_f
			end

			results["#{name}"][fl] = flog
			results["#{name}"][fl+7] = flay
			fl += 1 
		end
	end
	folder += 1
end

time = (Time.now - start).to_f
result_name = "results_Stanislav_Iliev_B_26"
results = results.sort

if ARGV[1] == "-o"
	if ARGV[2] == "csv"
		write_to_CSV(results,time,result_name)
	elsif ARGV[2] == "html"
		write_to_HTML(results,time,result_name)
	elsif ARGV[2] == "svg"
		write_to_SVG(results,time,result_name)
	elsif ARGV[2] == "xml"
		write_to_XML(results,time,result_name)
	elsif ARGV[2] == "json"
		write_to_JSON(results,time,result_name)
	end
end