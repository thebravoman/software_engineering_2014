patka = Hash.new

Dir.glob("#{ARGV[0]}/**/*.*").each do |raw_file|
	i = 0
	filename = raw_file.split("/").last
	patka[filename] = 0
	file = File.open("#{raw_file}")
	file_read = file.readlines
	file_read.each do |line|
		line.split(" ").each do |word|
			if word.length == 10
				i += 1
				patka[filename] = i
			end
		end
	end
end

patka = patka.sort_by{|key,val| val}

File.open("result.xml","w") do |xml|
	xml.write("<results>\n")
	patka.each do |key,value|
		xml.write("<#{key}>#{value}</#{key}>\n")
	end
	xml.write("</results>")
end

=begin
 __     ________ _      _      ______          __  _____     _______ _  __           
 \ \   / /  ____| |    | |    / __ \ \        / / |  __ \ /\|__   __| |/ /    /\     
  \ \_/ /| |__  | |    | |   | |  | \ \  /\  / /  | |__) /  \  | |  | ' /    /  \    
   \   / |  __| | |    | |   | |  | |\ \/  \/ /   |  ___/ /\ \ | |  |  <    / /\ \   
    | |  | |____| |____| |___| |__| | \  /\  /    | |  / ____ \| |  | . \  / ____ \  
    |_|  |______|______|______\____/   \/  \/     |_| /_/    \_\_|  |_|\_\/_/    \_\

=end