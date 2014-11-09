require 'csv'
currentD = Dir.getwd

folder = Hash.new
folder["vh"] = Dir.glob("#{ARGV[0]}/vhodno_nivo/**/*.*")
folder["002"] = Dir.glob("#{ARGV[0]}/class002_homework/**/*.rb")
folder["003"] = Dir.glob("#{ARGV[0]}/class003_homework/**/*.rb")
folder["004"] = Dir.glob("#{ARGV[0]}/class004/**/*.rb")
folder["009"] = Dir.glob("#{ARGV[0]}/class009_homework/**/*.pdf")
folder["012"] = Dir.glob("#{ARGV[0]}/class012_homework/**/*.rb")

results = Hash.new

def student()
	hws = Hash.new(0)
	hws["VH"] = 0
	hws["002"] = 0
	hws["003"] = 0
	hws["004"] = 0
	hws["009"] = 0
	hws["012"] = 0
	return hws
end

times = Hash.new
times["002"] = "22.09.2014:20:00:00"
times["003"] = "24.09.2014:20:00:00"
times["004"] = "29.09.2014:20:00:00"
times["009"] = "27.10.2014:20:00:00"
times["012"] = "10.11.2014:20:00:00"

folder["vh"].each do |f|
	sf = f.split("/").last.split(".").first
	if sf.split("_").length >= 2 then
		fn = sf.split("_")[0].capitalize
		ln = sf.split("_")[1].capitalize
		sfs = "#{fn}" + "_" + "#{ln}"

		if results[sfs] == nil
			results[sfs] = student()
		end

		ever = Dir.entries("#{ARGV[0]}/vhodno_nivo/")
		ever.uniq!
		ever.delete_if {|s| File.extname(s) == ".html" || File.extname(s) == "" || File.extname(s) == ".pdf" || File.extname(s) == ".txt" || File.extname(s) == ".md" || s.include?("~") || !s.include?("_")}
		ever.sort!

		count = Hash.new(0)
		ever.each do |stt|
			count[sfs] += 1
		end

		count.each do |k, v|
			if v > 2 then
				results[k]["VH"] = 1
			end
		end

		Dir.chdir("#{File.dirname("#{f}")}")
		time = `git log --until=#{times["VH"]} #{f}` 

		if !time.empty? then
			results[sfs]["VH"] = 2
		end	
	end
end

for i in 2..4
	folder["00#{i.to_s}"].each do |f|
		sf = f.split("/").last.split(".").first
		if sf.split("_").length >= 2 then
			fn = sf.split("_")[0].capitalize
			ln = sf.split("_")[1].capitalize
			sfs = "#{fn}" + "_" + "#{ln}"

			if results[sfs] == nil
				results[sfs] = student()
			end

			if f.include?(sfs) then
				results[sfs]["00#{i.to_s}"] = 1
			end

			Dir.chdir("#{File.dirname("#{f}")}")
			time = `git log --until=#{times["00#{i.to_s}"]} #{f}` 

			if !time.empty? then
				results[sfs]["00#{i.to_s}"] = 2
			end
		end	
	end
end

teamms = Hash.new
CSV.foreach("#{ARGV[0]}/class009_homework/project_to_names.csv") do |row|
	if row.length == 2 then
		if row[0].split(" ").length > 1 then
			r0 = "#{row[0].split(" ")[0]}" + "_" + "#{row[0].split(" ")[1]}"
		else
			r0 = row[0]
		end

		if row[1].split(" ").length > 1 then
			r1 = "#{row[1].split(" ")[0]}" + "_" + "#{row[1].split(" ")[1]}"
		else
			r1 = row[1]
		end

		teamms[r1] = r0
	end
end

teamms.each do |k, v|
	next if k == "Studen_Name"
	folder["009"].each do |f|
		sf = f.split("/").last.split(".").first

		if results[k] == nil
			results[k] = student()
		end

		if v == sf
			results[k]["009"] =  1
		end

		Dir.chdir("#{File.dirname("#{f}")}")
		time = `git log -- until=#{times["019"]} #{File.dirname("#{f}")}` 
		if !time.empty? then
			results[k]["009"] = 2
		end		
	
	end
end

folder["012"].each do |f|
		sf = f.split("/").last.split(".").first
		if sf.split("_").length >= 2 then
			fn = sf.split("_")[0].capitalize
			ln = sf.split("_")[1].capitalize
			sfs = "#{fn}" + "_" + "#{ln}"

			if results[sfs] == nil
				results[sfs] = student()
			end

			if f.include?(sfs) then
				results[sfs]["012"] = 1
			end

			Dir.chdir("#{File.dirname("#{f}")}")
			time = `git log -- until=#{times["012"]} #{File.dirname("#{f}")}` 

			if !time.empty? then
				results[sfs]["012"] = 2
			end
		end	
	end

Dir.chdir("#{currentD}")
CSV.open("results_Veselina_Kolova_B_8.csv", "w") do |csv|
	csv << [" ", " ", results.first[1].keys].flatten
	results.keys.sort.each do |k, v|
		csv << [k.split("_")[0], k.split("_")[1], results[k].values].flatten
	end
end
