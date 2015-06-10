require_relative 'rsa.rb'

generator = Rsa::Generator.new
crypt = Rsa::Crypter.new
case ARGV[0]
	when "-c"
		encrypted_message = crypt.encrypt ARGV[1], ARGV[2].to_i, ARGV[3].to_i
	when "-d"
		decrypted_message = crypt.decrypt ARGV[1], ARGV[2].to_i, ARGV[3].to_i
	when "-g"
		result = generator.generate_keys ARGV[1].to_i, ARGV[2].to_i, ARGV[3].to_i
	else
		puts "unrecognized option"
end
