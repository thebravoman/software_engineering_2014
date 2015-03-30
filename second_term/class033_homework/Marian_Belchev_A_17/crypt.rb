require 'prime'

def random_number first, last
	rand first..last
end

def pick_prime
	begin
		number = random_number 2, 100
	end until Prime.prime? number

	number
end

def crypt e, n, string
	crypted_msg = Array.new

	string.each_byte do |c|
		crypted_msg << (c^e) % n
	end

	crypted_msg
end

def decrypt d, n, crypted
	decrypted_msg = ''

	crypted.each do |c|
		decrypted_msg += ((c^d) % n).chr
	end

	decrypted_msg
end

p = pick_prime
q = pick_prime
n = p*q
phi = (p-1)*(q-1)
e = random_number(1, phi)
d = e

print 'Enter string: '
crypted = crypt(e, n, gets.chomp)
decrypted = decrypt(d, n, crypted)

puts "Crypted = #{crypted}", "Decrypted = #{decrypted}"