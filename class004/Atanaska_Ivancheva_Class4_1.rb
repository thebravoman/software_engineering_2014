array=Array.new(19,0)  

Dir.glob("#{ARGV.first}/*.*") do |my_text_file|
	
	s=my_text_file.split(/_/) 
	num=s.last.split(/\./).first
	num=num.to_i
	
		if num>=1 && num<=19
		array[num-1] += 1
		end
end
	
counter=0
for counter in 2..18
  print "#{counter}"
  
  if counter!=18
  print ","
  
  else
  puts ""
  end
end

for counter in 1..17
  print "#{array[counter]}"
  
  if counter!=17
  print ","
  
  else 
  puts ""
  end
end
