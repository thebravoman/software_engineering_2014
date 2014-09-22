p = 0
b = 0
a = Hash.new
d = Hash.new
zad = ""
Dir.glob("/home/suni/suni/*.*") do |my_text_file|
short_name = my_text_file.split('/').last.split('.').first
name = short_name.split("_")[0]+"_"+short_name.split("_")[1]
  Dir.glob("/home/suni/suni/#{name}*.*") do |o|
zad = zad +" "+ o.split('_').last.split('.').first
p = o.split('_').last.split('.').first
b = b + p.to_i
  end
a["#{name}"] = zad
zad = ""
d["#{name}"] = b
b = 0
end
a.each {|k,v| puts "#{k}#{v}" }
d.each {|k,v| puts "#{k} sbor #{v}" }