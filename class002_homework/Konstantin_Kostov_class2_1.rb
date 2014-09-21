c=Array.new(20,0)
Dir.glob("/home/kosio345/Documents/software_engineering_2014/vhodno_nivo/**/*.*") do |my_text_file|
  s = my_text_file.split(/_/)
  number= s.last.split(/\./).first
  if number.length < 3
  i=number.to_i
  if i<=20
  c[i]=c[i]+1
    end
    end
    end
  for i in 2..19 do
    puts "#{i},#{c[i]}"
end
