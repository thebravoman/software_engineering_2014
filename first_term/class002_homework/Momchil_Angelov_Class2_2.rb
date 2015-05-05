Dir.glob("D:/domashno/prog/Ruby programs/ZIPOVETE/software_engineering_2014-master/**/*.*") do |my_text_file|
  
  wholefile = my_text_file.split("/").last
  number=wholefile.split("_").last.split(".").first
  name = wholefile.split(".").first.split("_")
  allstuff="#{name[0]}"+" #{name[1]}" +" #{number}"
  puts ("#{allstuff}")
  
 end

gets
