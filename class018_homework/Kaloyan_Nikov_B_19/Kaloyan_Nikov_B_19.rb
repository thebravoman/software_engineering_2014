# encoding: utf-8
require 'yaml'
require_relative 'write_csv.rb'
require_relative 'write_html.rb'
require_relative 'write_svg.rb'
require_relative 'write_xml.rb'
require_relative 'write_json.rb'

start = Time.now

if ARGV[0] == nil
	puts "Expected: ruby Kaloyan_Nikov_B_19.rb {path to repo} -o {output format}"
	exit 1
end

if ARGV[0][-1] != "/"
	ARGV[0] += "/"
end

n = -1
n = ARGV[4].to_i if ARGV[3] == "-n"

directories = YAML.load_file("config.yaml")

results = Hash.new{|hash,key| hash[key] = Array.new(directories.size) {0}}
vhodno = Hash.new{|hash,key| hash[key] = [0,0]}
class009 = Hash.new{|hash,key| hash[key] = []}

File.open("#{ARGV[0]}class009_homework/project_to_names.csv", "r").each_line{ |line|
	class009[line.chomp.split(",")[0]] << line.chomp.split(",")[1]
}
class009.delete("Project Name")

i = 0 #position in results hash
fl = directories.size #position for flog and flay

directories.each do |dir, directory_and_deadline|
	puts "Checking #{directory_and_deadline[0].split("/").first} (#{i+1}/#{directories.length})"
	count = 0
	directory = directory_and_deadline[0]
	deadline = directory_and_deadline[1]
	Dir.glob("#{ARGV[0]}#{directory}").each do |script_file|
		break if count == n
		count += 1
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
					results["#{student}"][i] = 2
				end
				next
			end

			results["#{name}"][i] = 2
		else
			if dir == 0
				vhodno["#{name}"][1] += 1
				if vhodno["#{name}"][1] + vhodno["#{name}"][0] != 3
					next
				end
			end
			if dir == 9
				class009["#{name}"].each do |student|
					results["#{student}"][i] = 1
				end
				next
			end

			results["#{name}"][i] = 1
		end
		
		if dir != 0 and dir != 9 and dir != 172
			flog = `flog #{script_file} --continue 2>/dev/null`
			flay = `flay #{script_file} 2>/dev/null | grep #{script_file.split(/\//).last.split("_").first.capitalize} | wc -l`
			if flog != "" then
				flog = flog.split(/\n/).first.split(/:/).first.to_f
			end

			results["#{name}"][fl] = flog
			results["#{name}"][fl+7] = flay.to_f
		end
	end
	
	i += 1
	if dir != 0 and dir != 9 and dir != 172
		fl += 1
	end
end

time = (Time.now - start).to_f
result_name = "results_Kaloyan_Nikov_B_19"
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
