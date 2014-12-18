class CaesarCrypt

	def crypt arg
		result = ""
		arg.each_char do |c| 
			result += (c == "z") ? "a": c.succ
			# when the c is 'z' ....
			#~ result += c.succ[0]
		end
		result
	end
		
end
