as = 0
op = 0
arr = Array.new(100)
p = 0
b = 0
a = Hash.new
d = Hash.new
zad = ""
path = ARGV[0]
  Dir.glob(path + "**/*.*") do |my_text_file|
    short_name = my_text_file.split('/').last.split('.').first
		name = short_name.split("_")[0]
		if short_name.split("_")[1]
			name = name + "_" + short_name.split("_")[1]
		end
    if short_name.split('_').last.split('.').first.to_i < 19 and short_name.split('_').last.split('.').first.to_i > 1
  Dir.glob(path + "#{name}*.*") do |o|  
    zad = zad + o.split('_').last.split('.').first+","
    p = o.split('_').last.split('.').first
    b += p.to_i
    end
    a["#{short_name.split("_")[0]+" "+short_name.split("_")[1]}"] = zad
    zad = ""
    d["#{name}"] = b
    b = 0
    end
    end
   Hash[a.sort].each {|k,v|
   Hash[d.sort].each {|k,v| 
        op+=1   
        arr[op] = v
          } 
        as+=1
        puts "#{k},#{v}#{arr[as]}"
        }
