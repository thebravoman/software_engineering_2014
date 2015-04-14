require_relative "RSA.rb"

r = RSA.new
data_string = String.new
data_string << r.getPublicKey.to_s << "," << r.getN.to_s << "," << r.getPrivateKey.to_s
File.write('./crypt_data.csv', data_string)
if ARGV[0].eql?("encrypt")
	p r.encrypt ARGV[1].to_i, ARGV[2].to_i, ARGV[3]
elsif ARGV[0].eql?("decrypt")
	values = Array.new
	values = File.read("./crypt_data.csv").split(',')
	decryptor = RSA.new
	decryptor.setValues values[1], values[0], values[2]
	decryptor.decrypt ARGV[1].to_s
end
	