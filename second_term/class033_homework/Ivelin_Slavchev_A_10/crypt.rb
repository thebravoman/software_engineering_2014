require 'prime'

def rand_primes
	begin
		p = rand(10..40)
		q = rand(10..40)
	end while(!Prime.prime?(p) && !Prime.prime?(q))
	
	@primes << p << q
end

def	get_keys
	@n = @primes[0] * @primes[1]
	o = (@primes[0] - 1) * (@primes[1] - 1)
	
	begin
		@e = rand(2...o)
	end while(extended_gcd(o, @e) != 1 && !Prime.prime?(@e))
	
	@d,y = extended_gcd(@e, o)	
	@d += o if @d < 0
	
	puts "Public key: #{@e}, #{@n}"
	puts "Private key: #{@d}, #{@n}"
end

def extended_gcd(a, b)
	return [0, 1] if a % b == 0
	
	x, y = extended_gcd(b, a %(b))
	[y, x - y * (a / b)]
end

def encrypt message
	encrypted = []
	
	message.each_byte do |c|
		encrypted << c ** @e %(@n)
	end
	
	puts "Encrypted: #{encrypted.join("")}"
	encrypted
end

def decrypt message
	decrypted = []

	message.each do |c|
		decrypted << (c ** @d %(@n)).chr(Encoding::UTF_8)
	end
	
	puts "Message: #{decrypted.join("")}"
end

puts "Enter message: "
message = gets.chomp

@primes = []
encrypted = []

rand_primes
get_keys
encrypted = encrypt message
decrypt encrypted
