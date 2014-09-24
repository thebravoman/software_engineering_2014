	def is_number?(object) end
	b = [1..1000]
	c = [1..1000]
	i = 0

	ARGV.each do|d|
		Dir.glob("#{d}/**/*.*") do |my_text_file|
			number = my_text_file.split(/_/).last
			extension  = number.split(/\./).last
			if extension.length < 5 and !extension.include? '~'
				number = number.split(/\./).first
			end
	
			class String
  				def is_number?
  					true if Float(self) rescue false
  				end
			end
			if number.is_number?
				i = i+1
				c[i] = number.to_i
			end
		end
		for k in 2..18
			ii = 0
			b[k] = 0
			for j in 1..i
				if c[j] == k then
					ii = ii + 1
					b[k] = ii
				end
			end
		end
		for i in 2..k
			if i == k
				puts ",#{i}"
			else	
				if i == 2
					print "#{i}"	
				else
					print ",#{i}"
				end
			end
		end
		for i in 2..k
			if i == 2
				print "#{b[i]}"
			else 
				if i == k
					puts ",#{b[i]}"
				else
					print ",#{b[i]}"
				end		
			end
		end
	end
