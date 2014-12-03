startTime = Time.now
require 'yaml'
require_relative 'csv_writer.rb'
require_relative 'json_writer.rb'
require_relative 'html_writer.rb'
require_relative 'xml_writer.rb'
require_relative 'svg_writer.rb'

currentDir = Dir.getwd
results = Hash.new

classes = YAML.load_file("config.yml")

def set_student()
	hws = YAML.load_file("st_config.yml")
	return hws
end

def if_set_student(results, sfs)
	if results[sfs] == nil
		results[sfs] = set_student()
	end
end

def split(sf)
	if sf.split('_').length >= 2 then
		fn = sf.split("_")[0].capitalize
		ln = sf.split("_")[1].capitalize
		sp = "#{fn}" + "_" + "#{ln}"
		return sp
	else
		return sf
	end
end

def check_vh(results, k, sfs)
		all = Array.new
		all = Dir.entries("#{ARGV[0]}/vhodno_nivo/")
		all.uniq!
		all.delete_if {|s| File.extname(s) == ".html" || File.extname(s) == "" || File.extname(s) == ".pdf" || File.extname(s) == ".txt" || File.extname(s) == ".md" || s.include?("~") || !s.include?("_")}
		all.sort!

		count = Hash.new(0)
		all.each { |stt| count[sfs] += 1 }
		count.each { |l, m| if m > 2 then results[l]["#{k}"] = 1 end }
end

def check_flog(results, k, f, sfs)
		results[sfs]["g#{k}"] = `flog #{f}`.split(':').first
end


teamms = Hash.new
CSV.foreach("#{ARGV[0]}/class009_homework/project_to_names.csv") do |row|
	if row.length == 2 then
		if row[0].split(" ").length >= 2 then
			r0 = "#{row[0].split(" ")[0].capitalize}" + "_" + "#{row[0].split(" ")[1].capitalize}"
		else
			r0 = row[0]
		end
		if row[1].split(" ").length >= 2 then
			r1 = "#{row[1].split(" ")[0].capitalize}" + "_" + "#{row[1].split(" ")[1].capitalize}"
		else
			r1 = row[1]
		end
		teamms["#{r1}"] = r0
	end
end

def time_check(results, deadl, f, k, sfs)
	Dir.chdir("#{File.dirname("#{f}")}")
	time = `git log --until=#{deadl} -- #{f}`

	if !time.empty? then
		results[sfs]["#{k}"] = 2
	end
end

def check_nine(results, teamms, sf, p)
	teamms.each do |k, v|
		next if k == "Student_Name"
		if v == sf
			results[k][p] =  1
			time_check(results, deadl, sf, p, k)
		end
	end
end

if "#{ARGV[3]}" == "-n" then
	if ARGV[4]
		num = "#{ARGV[4]}".to_i
	end
end


classes.each do |cl|
	cl.each do |fold, deadl|
		numb.times do
			fold.each do |f|
				sf = f.split("/").last.split(".").first
				sfs = split(sf)

				case fold
					when "Dir.glob('#{ARGV[0]}/vhodno_nivo/**/*.*')"
						if sf.split("_").length >= 2 then
							if_set_student(results, sfs)
							check_vh(results, fold, sfs)
							time_check(results, deadl, f, fold, sfs)
						end
					when "Dir.glob('#{ARGV[0]}/class009_homework/**/*.pdf')"
						check_nine(results, teamms, sf, fold)
					else
						if_set_student(results, sfs)
						results[sfs][k] = 1
						time_check(results, deadl, f, fold, sfs)
						check_flog(results, fold, f, sfs)
				end
			end
		end
	end
end

Dir.chdir("#{currentDir}")
time = Time.now - startTime

if "#{ARGV[1]}" == "-o" then
	if ARGV[2] then
		case ARGV[2]
			when "csv"
				writer = CSVWriter.new
				writer.write(results, time)
			when "json"
				writer = JSONWriter.new
				writer.write(results)
			when "html"
				writer = HTMLWriter.new
				writer.write(results)
			when "xml"
				writer = XMLWriter.new
				writer.write(results)
			when "svg"
				writer = SVGWriter.new
				writer.write(results)
			else
				puts "ERROR."
		end
	end
end
