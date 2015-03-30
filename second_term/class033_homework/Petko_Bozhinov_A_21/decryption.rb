class Decryption

	def return_string string, private_key
		string.collect! do |str|
			str = str - private_key
		end
		puts "Decrypted string: #{string.pack('c*')}"
	end

	def initialize string, private_key
		return_string string, private_key
	end

end