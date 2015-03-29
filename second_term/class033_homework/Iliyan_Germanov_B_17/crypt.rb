require_relative 'key_generator.rb'
require_relative 'rsa_crypt.rb'

abort(File.read("README.txt")) if ARGV[0] == nil or ARGV[0] == 'help' or ARGV[0] == '-help'

case ARGV[0]
when 'generate_keys'
	keygen = KeyGenerator.new 11, 13
	filename = ARGV[1] || 'keyfile.yaml'
	KeyGenerator.save_keys_to_file filename, keygen.generate
when 'encrypt', 'decrypt'
	keys = KeyGenerator.load_keys_from_file ARGV[2]
	rsa = RSACrypt.new keys
	if ARGV[0] == 'encrypt'
		rsa.encrypt_file ARGV[1]
	else
		rsa.decrypt_file ARGV[1]
	end
else
	puts "Invalid first argument!"
	puts File.read("README.txt")
end 
