data = "THIS IS SOME SERIOUS DATA YOU'VE GOT HERE"
number = 2

#encrypt
def encrypt(raw_data, key)
	crypted_data = Array.new
	raw_data.each_char do |char|
		crypted_data << (char.ord + key).chr
	end
	return crypted_data.join
end

#decrypt
def decrypt(crypted_data, key)
	raw_data = Array.new
	crypted_data.each_char do |char|
		raw_data << (char.ord - key).chr
	end
	return raw_data.join
end


crypted = encrypt(data, number)
puts crypted
puts "//////////////////////"
decrypted = decrypt(crypted, number)
puts decrypted
