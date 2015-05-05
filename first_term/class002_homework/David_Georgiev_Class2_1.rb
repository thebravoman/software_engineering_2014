	i = 0
	def is_number?(object) end
	a = [1..1000]
	b = [1..1000]
	c = [1..1000]
	
	Dir.glob("#{pathToDirectory}/*.*") do |my_text_file|
	
	s = my_text_file.split(/_/)
	number = s.last.split(/\./).first
	
	class String
  	def is_number?
  	  true if Float(self) rescue false
  	end
	end
	if number.is_number?
		i = i+1
		a[i] = number
		c[i] = a[i].to_i
	end
	end
	for k in 1..19
		ii = 0
		for j in 1..i
			if c[j] == k then
				ii = ii + 1
				b[k] = ii
			end
		end
	end
	for i in 1..k
		puts "#{i},#{b[i]}"
	end
	
