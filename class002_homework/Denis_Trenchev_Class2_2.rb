 Dir.glob("C:/Users/Denis/Desktop/software_engineering_2014-master/vhodno_nivo/**/*.*") do |MyFile|
  
  fileonly = MyFile.split("/").last
  name = fileonly.split(".").first.split("_")
  exercise = fileonly.split("_").last.split(".").first
  
  
 end
 
 gets
