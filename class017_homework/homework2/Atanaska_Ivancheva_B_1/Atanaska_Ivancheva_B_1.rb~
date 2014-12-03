startTime = Time.now
require_relative 'csv_writer.rb'
require_relative 'json_writer.rb'
require_relative 'html_writer.rb'
require_relative 'xml_writer.rb'
require_relative 'svg_writer.rb'

currentDir = Dir.getwd
results = Hash.new

folders = Hash.new
folders["VH"] = Dir.glob("#{ARGV[0]}/vhodno_nivo/**/*.*")
folders["002"] = Dir.glob("#{ARGV[0]}/class002_homework/**/*.rb")
folders["003"] = Dir.glob("#{ARGV[0]}/class003_homework/**/*.rb")
folders["004"] = Dir.glob("#{ARGV[0]}/class004/**/*.rb")
folders["009"] = Dir.glob("#{ARGV[0]}/class009_homework/**/*.pdf")
folders["012"] = Dir.glob("#{ARGV[0]}/class012_homework/**/*_*_*_*.rb")
folders["014"] = Dir.glob("#{ARGV[0]}/class014_homework/**/*_*_*_*.rb")
folders["015"] = Dir.glob("#{ARGV[0]}/class015_homework/**/*_*_*_*.rb")
folders["017x1"] = Dir.glob("#{ARGV[0]}/class017_homework/homework1/**/*_*_*_*.rb")
folders["017x2"] = Dir.glob("#{ARGV[0]}/class017_homework/homework2/**/*_*_*_*.rb")

$deadlines = Hash.new
$deadlines["VH"] = "17.09.2014:20:00:00"
$deadlines["002"] = "22.09.2014:20:00:00"
$deadlines["003"] = "24.09.2014:20:00:00"
$deadlines["004"] = "29.09.2014:20:00:00"
$deadlines["009"] = "27.10.2014:20:00:00"
$deadlines["012"] = "10.11.2014:20:00:00"
$deadlines["014"] = "13.11.2014:06:00:00"
$deadlines["015"] = "20.11.2014:06:00:00"
$deadlines["017x1"] = "02.12.2014:06:00:00"
$deadlines["017x2"] = "02.12.2014:06:00:00"


def set_student()
	hws = Hash.new(0)
	hws["VH"] = 0
	hws["002"] = 0
	hws["003"] = 0
	hws["004"] = 0
	hws["009"] = 0
	hws["012"] = 0
	hws["014"] = 0
	hws["015"] = 0
	hws["017x1"] = 0
	hws["017x2"] = 0
	hws["g002"] = 0
	hws["g003"] = 0
	hws["g004"] = 0
	hws["g009"] = 0
	hws["g012"] = 0
	hws["g014"] = 0
	hws["g015"] = 0
	hws["g017x1"] = 0
	hws["g017x2"] = 0
	hws["y002"] = 0
	hws["y003"] = 0
	hws["y004"] = 0
	hws["y009"] = 0
	hws["y012"] = 0
	hws["y014"] = 0
	hws["y015"] = 0
	hws["y017x1"] = 0
	hws["y017x2"] = 0
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

def check_flay(results, folders, p, f, sfs)
	results[sfs]["y#{p}"] = `flay "#{folders[p]}" | grep "#{sfs}" | wc -l`
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

def time_check(results, deadlines, f, k, sfs)
	Dir.chdir("#{File.dirname("#{f}")}")
	time = `git log --until=#{deadlines["#{k}"]} -- #{f}`

	if !time.empty? then
		results[sfs]["#{k}"] = 2
	end
end

def check_nine(results, teamms, sf, p)
	teamms.each do |k, v|
		next if k == "Student_Name"
		if v == sf
			results[k][p] =  1
			time_check(results, $deadlines, sf, p, k)
		end
	end
end

folders.each do |k, v|
	v.each do |f|
		sf = f.split("/").last.split(".").first
		sfs = split(sf)

		case k
			when "VH"
				if sf.split("_").length >= 2 then
					if_set_student(results, sfs)
					check_vh(results, k, sfs)
					time_check(results, $deadlines, f, k, sfs)
				end
			when "009"
				check_nine(results, teamms, sf, k)
			else
				if_set_student(results, sfs)
				results[sfs][k] = 1
				time_check(results, $deadlines, f, k, sfs)
				check_flog(results, k, f, sfs)
				check_flay(results, folders, k, f, sfs)
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
