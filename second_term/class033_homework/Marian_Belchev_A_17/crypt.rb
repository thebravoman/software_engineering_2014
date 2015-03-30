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

def extended_gcd e, phi
  return [0,1] if e % phi == 0
  x,y = extended_gcd phi, (e % phi)
  [y, x-y*(e / phi)]
end

def return_d e, phi
  x,y = extended_gcd e,phi 
  x += phi if x<0 
  x 
end

p = pick_prime
q = pick_prime
n = p*q
phi = (p-1)*(q-1)
e = random_number 1, phi
d = return_d e, phi

puts "Public key: #{e}"
puts "Private key: #{d}"

print 'Enter string: '
crypted = crypt(e, n, gets.chomp)
decrypted = decrypt(e, n, crypted)

puts "Crypted = #{crypted}", "Decrypted = #{decrypted}"