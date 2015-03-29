class RSACrypt
	@keys = {}

	def initialize keys
		@keys = keys
	end

	def encrypt m 
		(m ** @keys["e"]) % @keys["n"]
	end

	def decrypt c
		(c ** @keys["d"]) % @keys["n"]
	end

	def encrypt_string message
		encrypted = []
		message.each_char { |char| encrypted << encrypt(char.ord) }
		encrypted
	end

	def decrypt_array encrypted_arr
		message = ""
		encrypted_arr.each {|el| message += decrypt(el).chr }
		message
	end

	def encrypt_file path_to_file
		if not File.file? path_to_file
			puts "File does not exists!" 
			return
		end
		file_content = File.read(path_to_file)
		File.open(path_to_file, 'w') {|file| file.puts(encrypt_string file_content)}
		puts "File encrypted sucessfully!"
	end

	def decrypt_file path_to_file
		if not File.file? path_to_file
			puts "File does not exists!"
			return
		end
		arr = []
		File.read(path_to_file).each_line {|line| arr << line.chop.to_i }
		File.open(path_to_file, 'w') {|file| file.puts(decrypt_array arr) }
		puts "File decrypted successfully!"
	end
end
