justahash=Hash.new("");
path_to_folder="" 
ARGV.each do |v| 
  path_to_folder = v
end
Dir.glob(path_to_folder + "/*/*") do |my_text_file|
#puts "ASDASDASDASD"
 #THE WHOLE FILE (without the pathing to it)
  wholefile = my_text_file.split("/").last
 #TASK NUMBER 
  aisanumber=wholefile.split("_").last.split(".").first
 #FIRST NAME
  bisaname = wholefile.split("_").first
 #LAST NAME 
  cisalastname = wholefile.split("_", 2).last.split(".").first
  disalastname = cisalastname.split("_").first
 #INITIALIZING HASHES 
  justahash[bisaname + disalastname] += aisanumber + ","

	end
 #FOREVERYHASHDO
justahash.each do |key, value|
	eisatotalscore = 0
	value.split(",").each do |x|
		eisatotalscore += x.to_i
	end
	puts key + "," + value + eisatotalscore.to_s
	
end 