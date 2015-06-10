class Sym
	def initialize
		@n = 0
		@value = Array.new
		inc	
	end
	def inc
		for i in 0..255
			@value.push(i.chr)
		end
		@n += 256
	end
	def sym n
		while n >= @n
			inc
		end
		@value[n % 256]
	end	
end
