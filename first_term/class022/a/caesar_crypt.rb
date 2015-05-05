class CaesarCrypt
	
	def crypt arg
		result = ""
		arg.each_char do |c|
			converted = (is_over? c) ? c.succ[0] : c.succ
			result += converted
		end
		result
	end
	
	private
	def is_over? c
		c == "z"
	end
	
end
