class Sym
	def initialize
		@n = 0
		@value = Array.new
		inc	
	end
	def inc
		for i in 32..126
			@value.push(i.chr)
		end
		@n += 94
	end
	def sym n
		while n >= @n
			inc
		end
		@value[(n%94) - 32]
	end	
end
