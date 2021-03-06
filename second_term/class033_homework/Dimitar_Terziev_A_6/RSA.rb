class RSA
private
	def is_prime? n
		return n > 1 if n <=3
		return false if n % 2 == 0 || n % 3 == 0
		
		i = 5
		while i*i <= n 
		    return false if (n % i == 0 || n % (i + 2) == 0)
		    i += 6
		end 
		
		true	
	end
	def rand_prime n
		loop do
			l = rand(n)
			return l if is_prime? l
		end
	end
	def find_euler_n
		p = rand_prime(11..100)
		q = rand_prime(11..100)
		@n = p*q
		@en = (p-1)*(q-1)
	end
	
	def coprime? a, b
		a.gcd(b) == 1
	end
	
    def extended_gcd( a, b )
      return [0,1] if a % b == 0
      x, y = extended_gcd( b, a % b )
      [y, x - y * (a / b)]
    end
    	def gen_pub_key
		find_euler_n
		1.upto(100) do |i| 
			 l = rand(@en)
			 if coprime? l, @en
			 	@public_key = l
			 	return @public_key
			 end
		end
		@public_key = 65537
	end
	def gen_priv_key
		x, y = extended_gcd( @public_key, @en )
		x += @en if x < 0
		@private_key = x
	end
public
	def initialize
		gen_pub_key
		gen_priv_key
	end
	def encrypt mes
		encrypted = Array.new
		mes.each_char do |let|
			encrypted<< ((let.ord**@public_key)%@n)
		end
		encrypted
	end
	def decrypt encr
		decrypted = ""
		encr.each do |let|
			decrypted<< ((let**@private_key)%@n)
		end
		decrypted
	end
	def fancy_encrypt mes
		@public_key = gen_pub_key
		puts "public key: #{@public_key}\nn: #{@n}\nen: #{@en}\nencrypted message: "
		encr_mes = encrypt mes
		p encr_mes
		puts "\nshort: #{@public_key} #{@n} #{@en} #{p encr_mes}"
	end
	def fancy_decrypt pub_key, n, en, encr_mes
		@public_key = pub_key
		@en = en
		@n = n
		gen_priv_key
		puts "decrypted message: #{decrypt encr_mes}\n"
	end
end

r = RSA.new
#message = "The swallow barks twice at midnight"
if ARGV[0].eql? "encrypt"
	encrypted_message = r.fancy_encrypt ARGV[1..ARGV.size].join(" ")
end
if ARGV[0].eql? "decrypt"
	encr_mes =  ARGV[4..ARGV.size].join("").split("[").last.split("]").first.split(",").map(&:to_i)
	p encr_mes
	pub_key = ARGV[1].to_i
	n = ARGV[2].to_i
	en = ARGV[3].to_i
	decrypted_message = r.fancy_decrypt pub_key, n, en, encr_mes
end
