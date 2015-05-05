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

$deadlines = Hash.new
$deadlines["VH"] = "17.09.2014:20:00:00"
$deadlines["002"] = "22.09.2014:20:00:00"
$deadlines["003"] = "24.09.2014:20:00:00"
$deadlines["004"] = "29.09.2014:20:00:00"
$deadlines["009"] = "27.10.2014:20:00:00"
$deadlines["012"] = "10.11.2014:20:00:00"
$deadlines["014"] = "13.11.2014:06:00:00"

def set_student()
	hws = Hash.new(0)
	hws["VH"] = 0
	hws["002"] = 0
	hws["003"] = 0
	hws["004"] = 0
	hws["009"] = 0
	hws["012"] = 0
	hws["014"] = 0
	hws["g2"] = 0
	hws["g3"] = 0
	hws["g4"] = 0
	hws["g12"] = 0
	hws["g14"] = 0
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

def check_ff(results, k, f, sfs)
	case k
		when "002"
			results[sfs]["g2"] = `flog #{f}`.split(':').first
		when "003"
			results[sfs]["g3"] = `flog #{f}`.split(':').first
		when "004"
			results[sfs]["g4"] = `flog #{f}`.split(':').first
		when "012"
			results[sfs]["g12"] = `flog #{f}`.split(':').first
		when "014"
			results[sfs]["g14"] = `flog #{f}`.split(':').first
	end
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
				if_set_student(results, "#{sfs}")
				check_vh(results, "#{k}", "#{sfs}")
				time_check(results, $deadlines, "#{f}", "#{k}", "#{sfs}")
			end
		when "009"
			check_nine(results, teamms, "#{sf}", "#{k}")
		else
			if_set_student(results, "#{sfs}")
			results[sfs]["#{k}"] = 1
			time_check(results, $deadlines, f, "#{k}", "#{sfs}")
			check_ff(results, "#{k}", "#{f}", "#{sfs}")
		end
	end
end

Dir.chdir("#{currentDir}")

if "#{ARGV[1]}" == "-o" then
	if ARGV[2] then
		case ARGV[2]
			when "csv"
				writer = CSVWriter.new
			when "json"
				writer = JSONWriter.new
			when "html"
				writer = HTMLWriter.new
			when "xml"
				writer = XMLWriter.new
			when "svg"
				writer = SVGWriter.new
			else
				puts "ERROR."
		end
		writer.write(results)
	end
end
