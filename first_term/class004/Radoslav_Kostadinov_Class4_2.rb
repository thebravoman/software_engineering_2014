hash = Hash.new{|hash,key| hash[key] = []}
path = ARGV[0]
def all_letters(str)
    str[/[a-zA-Z]+/]  == str
end
extensions=['c','cc','cpp','cs','rb','py','java','js','html','php','pas']
Dir.glob("#{path}/**/*") do |my_text_file| 
		s = my_text_file.split(/\//).last
		b = s 
		s = s.split("_")
		first_name = s[0]
		last_name = s[1]
		number = s.last.split(/\./).first
		extension= s.last.split(".").last

		if extensions.include?(extension) and  !((first_name == "" || first_name == " ") || (last_name == "" || last_name == " ")) and all_letters(first_name) and all_letters(last_name)
			if (number.to_i>1) && (number.to_i <19) and b.count('_') == 2
				hash[first_name.capitalize + " " + last_name.capitalize] << number.to_i
			end
		end
end	

	hash.sort.each do |name, task|	
		print "#{name}"		
		sum = 0
		task = task.sort
		task.uniq.each do |j|
			print ",#{j}"
			sum += j.to_i	
		end
		puts ",#{sum}"
		end
