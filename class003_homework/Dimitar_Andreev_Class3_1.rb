d=Array.new(20,0)

Dir.glob("#{ARGV.first}/*.*") do |my_text_file|
  s = my_text_file.split(/_/)
  b= s.last.split(/\./).first.to_i
  d[b] += 1
end

for i in 1..19
  print "#{i},"
end
  puts ("\n")
for i in 1..19
  print "#{d[i]},"
end
