ec = Hash.new("");
Directfile = ARGV[0]

Dir.glob("#{Directfile}*/*.*") do |my_text_file| 
name = my_text_file.split('/').last.split('#{Directfile}')	
name = name.last.split('.').first.split("_")					
task = name[2]
if !task
 next
end

ec["#{name[0]} #{name[1]}"] += name[2] + ","
end

ec.each do  |kly4, stst|
suma = 0
stst.split(",").each do |prom|
suma += prom.to_i
end
puts kly4 + "," + stst + suma.to_s
end 