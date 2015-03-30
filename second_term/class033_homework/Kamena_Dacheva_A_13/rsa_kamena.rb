#----------------------------------------------------------------
# ruby rsa_kamena.rb
#----------------------------------------------------------------
require 'mathn'

prime_numbers = [2, 3, 5, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67]
co_prime_arr = Array.new
encrypted = Array.new
decrypted = ""

number = prime_numbers.shuffle.first(2)
n = number[0] * number[1]
z = (number[0] - 1) * (number[1] - 1)

def extended_gcd(a, b)
	last_remainder, remainder = a.abs, b.abs
	x, last_x, y, last_y = 0, 1, 1, 0
	while remainder != 0
		last_remainder, (quotient, remainder) = remainder, last_remainder.divmod(remainder)
		x, last_x = last_x - quotient*x, x
		y, last_y = last_y - quotient*y, y
	end
 
	return last_remainder, last_x * (a < 0 ? -1 : 1)
end

def get_d(e, et)
	g, x = extended_gcd(e, et)
	raise "The maths are broken!" if g != 1
	x%et
end

(2..z).each { |co_prime_z| co_prime_arr << co_prime_z.to_i if z%co_prime_z != 0 && co_prime_z.gcd(z) == 1 }

pub_key = co_prime_arr.shuffle.first # public key
pri_key = get_d(pub_key,z) # private key
puts "Public Key: \t #{pub_key}"
puts "Private Key: \t #{pri_key}"

print "Your text: \t "
text = gets.chomp

text.each_char { |char| encrypted << (char.ord ** pub_key) % n } # Encrypting
encrypted.each { |char|	decrypted += (char ** pri_key % n).chr } # Decrypting
puts "Encrypted: \t #{encrypted}"
puts "Decrypted: \t #{decrypted}"
