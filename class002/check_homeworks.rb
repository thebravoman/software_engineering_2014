Dir.glob("/home/kireto/tues/tp/software_engineering_2014/vhodno_nivo/*.*") do |my_text_file|
  puts "working on: #{my_text_file}..."
  
  s = my_text_file.split(/_/)
  puts s.last.split(/\./).first
end
