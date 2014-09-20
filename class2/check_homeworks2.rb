Dir.glob("/home/kireto/tues/tp/software_engineering_2014/vhodno_nivo/*.*") do |my_text_file|

  puts "#{my_text_file}"

  short_name = my_text_file.split('/').last
  puts short_name.split('.').first.split("_")
end
