Dir.glob("C:\Users\software_engineering_2014\vhodno_nivo*.*") do |my_text_file|
  puts "working on: #{my_text_file}..."

   s = my_text_file.split(/_/)
  puts s.last.split(/\./).first


require 'csv'
h = { 'First Name' => 's.split(/_/[0])', 'Last Name' => 's.split(/_/

[1]', 'Number' => 's.split(/_/[2]', 'Tasks' => 's.split(/_/[3]' }

CSV.open("data.csv", "wb") {|csv| h.to_a.each {|elem| csv << elem} }


end