require './keys.rb'
require './encryption.rb'
require './decryption.rb'

if !ARGV[0]
	puts "Please, submit an argument"
end

z = Keys.new
a = z.get_x
b = z.get_x
str_encr = Encryption.new ARGV[0], a
str_encr = str_encr.return_encrypted_string
str_encr = str_encr.bytes
Decryption.new str_encr, b