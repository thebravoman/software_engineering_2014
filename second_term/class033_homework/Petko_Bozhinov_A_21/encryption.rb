class Encryption

	def return_encrypted_string
		@encr_str
	end

	def return_bytes string, public_key
		bytes_of_string = string.bytes
		bytes_of_string.collect! do |str|
			str = str + public_key
		end
		@encr_str = bytes_of_string = bytes_of_string.pack('c*')
		@encr_str
	end

	def initialize string, public_key
		return_bytes string, public_key
		puts "Real string: #{string}"
		puts "Encrypted string: #{return_bytes string, public_key}"
	end

end