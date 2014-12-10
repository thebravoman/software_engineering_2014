###############################################################################################
###########ruby Lubomir_Yankov_A_16.rb repo-path -o fileformat -n count(optional)#############
##############################################################################################
require 'csv'
require 'yaml'
require_relative 'csvWriter.rb'
require_relative 'xmlWriter.rb'
require_relative 'jsonWriter.rb'
require_relative 'htmlWriter.rb'
require_relative "checks.rb" 
# require_relative 'svgWriter.rb'

start_time = Time.now

#----------------------------------- INITIALIZING --------------------------------------------#
@results = Hash.new
deadliness = Array.new
i = 0

homeworks = Hash.new
deadlines = Hash.new
flog = Hash.new
flay = Hash.new

config = Hash.new
config = YAML.load_file("config.yml")

@homeworks = config["homeworks"]
@deadlines = config["deadlines"]
@flog = config["flog"]
@flay = config["flay"]

@n = 0

@deadlines.each do |k, v|
	next if k.to_s == "VH" or k.to_s == "9"
	deadliness[i] = v.to_s
	i+= 1
end

check_arguments()

puts "\n--Homework Checker v1.0--\n"

puts "Now we wait...\n\n"

#------------------------------------------ MAIN -------------------------------------------------#
#------------------------------------ EXECUTING EVERYTHING ---------------------------------------#
i = 0
parseEntry("vhodno_nivo/**/*_*_*.*", "Sep--17--2014--20:00:00")
@homeworks.each do |num, path|
	
	next if num.to_s == "VH" or num.to_s == "9"
	parseDir(num.to_s, path.to_s, deadliness[i].to_s, 0)
	i+=1
						
end
parseTeams(0)

run_time = Time.now - start_time

puts "Program finished work in #{run_time.round} seconds."
puts "\nCopyright 2014 Ivchu & Lubchu. All rights reserved.\n\n"

#----------------------------------------- GENERATING FILE FORMATS ----------------------------------#
case @file_format
	
	when "-o csv"
	
		a = CSVWriter.new
		a.write(@results, run_time)

	when "-o xml"

		a = XMLWriter.new
		a.write(@results)

	when "-o json"

		a = JSONWriter.new
		a.write(@results)

	when "-o html"

		a = HTMLWriter.new
		a.write(@results)

	when "-o svg"

		abort("Sorry!")
		
	else
	
	abort("Invalid file format.")
		
end
