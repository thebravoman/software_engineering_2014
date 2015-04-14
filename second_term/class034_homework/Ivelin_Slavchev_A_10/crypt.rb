require 'prime'

def rand_primes
	begin
		p = rand(20..30)
		q = rand(20..30)
	end while(!Prime.prime?(p) && !Prime.prime?(q))
		
	@primes << p << q
end

def	get_keys
	@n = @primes[0] * @primes[1]
	o = (@primes[0] - 1) * (@primes[1] - 1)	
	
	begin
		@e = rand(2...o)
	end while(extended_gcd(o, @e) != 1 && !Prime.prime?(@e))
	
	begin
	@d,y = extended_gcd(@e, o)	
	@d += o if @d < 0
	end while @e == @d
	
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

	message.scan(/.{3}/).each do |c|
		decrypted << (c.to_i ** @d %(@n)).chr
	end
	
	puts "Message: #{decrypted.join("")}"
end

if ARGV[0] != nil 
	if ARGV[0] == "generate"
		@primes = []
		rand_primes
		get_keys
	end

	if ARGV[0] == "encrypt"
		puts "Enter message: "
		message = STDIN.gets.chomp
		encrypted = []
		puts "Enter public key(e): "
		@e = STDIN.gets.chomp.to_i
		puts "Enter public key(n): "
		@n = STDIN.gets.chomp.to_i
		encrypted = encrypt message
	end

	if ARGV[0] == "decrypt"
		puts "Enter encryption: "
		encrypted = STDIN.gets.chomp
		puts "Enter private key(d): "
		@d = STDIN.gets.chomp.to_i
		puts "Enter private key(n): "
		@n = STDIN.gets.chomp.to_i
		decrypt encrypted
	end
else
	puts "Error! No argument given. Please choose one:"
	puts "generate - Generates keys"
	puts "encrypt - Encrypt a message"
	puts "decrypt - Decrypt an encryption"
end
