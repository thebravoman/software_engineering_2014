require 'prime'

class RSA
	
	class << self
	
		def coprime?(a, b)
			1 == extended_gcd(a,b)
		end
		
		def generate_numbers		
			[random_prime, random_prime]
		end
		
		def random_prime
			r = rand(10..100)
			while(!Prime.prime?(r)) do  
				r = rand(10..100) 
			end
			r
		end
		
		def get_n(array)
			array[0] * array[1]
		end
		
		def get_phy_n(array)
			phy_n = ((array[0]-1) * (array[1]-1))
		end
		
		def get_public_key_number(phy_n)
			e = rand(1...phy_n)
			while((!coprime?(phy_n, e)) & !Prime.prime?(e)) do
				e = rand(1...phy_n)
			end
			e
		end
		
		def extended_gcd(a, b)
			return [0,1] if a % b == 0
			x, y = extended_gcd(b, a % b)
			[y, x - y * (a / b)]
		end
		
		def get_private_key_number(phy_n, e)
			x, y = extended_gcd(e, phy_n) 
			x += phy_n if x < 0
			x
		end
		
		def generate_keys
			@numbers = generate_numbers
			@n = get_n(@numbers)
			@phy_n = get_phy_n(@numbers)
			@e = get_public_key_number(@phy_n)
			@d = get_private_key_number(@phy_n, @e)
		end

		def print_keys				
			puts "\nThe public key is: (#{@e}, #{@n})"
			puts "The private key is: (#{@d}, #{@n})"
		end
		
		def encrypt(text)
			generate_keys
			string_to_bytes(text)
		end
		
		def decrypt(text)
			bytes_to_string(text)
		end
		
		def string_to_bytes(string)
			bytes = []
			string.each_byte do |byte|
				bytes << byte.to_i**@e % @n
			end
			bytes
		end
		
		def bytes_to_string(bytes)
			chars = []
			bytes.each do |byte|
				chars << (byte.to_i**@d % @n).chr
			end
			chars.join("")
		end
		
		def run
			print "\nEnter your message here: "
			message = gets.chomp
			encrypted_message = RSA.encrypt(message.downcase)
			RSA.print_keys
			puts "\nEncrypted message: #{encrypted_message}"
			decrypted_message = RSA.decrypt(encrypted_message)
			puts "\nDecrypted message: #{decrypted_message}\n\n"
		end
	end
end
RSA.run
