require_relative "beep.rb"
require_relative "csv_writer.rb"
require_relative "json_writer.rb"
require_relative "xml_writer.rb"
require_relative "html_writer.rb"
require_relative "svg_writer.rb"
require "yaml"
if (ARGV[1] == "-o")&&(ARGV[2] != nil)
	starting_time=Time.now
	results=Hash.new
=begin
	CSV.foreach(ARGV[0]+"/class009_homework/project_to_names.csv") do |name|	
	vh=name[1].split
	flname=vh[0]+"_"+vh[1]
	results[flname] = Hash.new	
	end#test#
=end

=begin
	hardcore = YAML.load_file("some.yaml")#("#{ARGV[0]}/class018_homework/Stanislav_Valkanov_A_25/some.yml")
	puts hardcore
	path = hardcore["path"]
	deadlines = hardcore["deadlines"]
	clas = hardcore["clas"]
	path.keys.each do |checki|

=end	
#	check3(checki, "#{ARGV[0]}/#{path[checki]}", 'git log --until=#{deadlines[checki]}',clas)
	

	end


	check3(results, "#{ARGV[0]}/class002_homework/*_*_*_*.rb", 'git log --until=22.09.2014:20:00:00', "002")
	check3(results, "#{ARGV[0]}/class003_homework/*_*_*_*.rb", 'git log --until=24.09.2014:20:00:00', "003")
	check3(results, "#{ARGV[0]}/class004/*_*_*_*.rb", 'git log --until=29.09.2014:20:00:00', "004")
	check3(results, "#{ARGV[0]}/class012_homework/*_*_*_*.rb", 'git log --until=10.11.2014:20:00:00', "012")
	check3(results, "#{ARGV[0]}/class014_homework/**/*_*_*_*.rb", 'git log --until=13.11.2014:06:00:00', "014")
	check3(results, "#{ARGV[0]}/class015_homework/**/*_*_*_*.rb", 'git log --until=20.11.2014:06:00:00', "015")
	check3(results, "#{ARGV[0]}/class017_homework/homework1/*_*_*_*.rb", 'git log --until=2.12.2014:06:00:00', "017_1")
	check3(results, "#{ARGV[0]}/class017_homework/homework2/**/*_*_*_*.rb", 'git log --until=2.12.2014:06:00:00', "017_2")
	check3(results, "#{ARGV[0]}/class018_homework/**/*_*_*_*.rb", 'git log --until=4.12.2014:06:00:00', "018")


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
		writer.write(results)
	#end
	#end
	t = (Time.now - starting_time).to_s
	puts t
	else
		puts "wrong argument"
	end
