class Cryptor

	def get_prime_nums
		prime_nums = []
		2.times do |_|
			number = rand(200..400)
			while not prime? number 
				number+=1
			end
			prime_nums.push number
		end
		prime_nums
	end

	def initialize
		@keys = generate_keys
	end

	def crypt message
		[].tap do |crypted|
			message.bytes { |byte| crypted.push byte**@keys[:pb_k] % @keys[:hp_k] }
		end
	end

	def uncrypt crypted
		"".tap do |message|
			crypted.each { |byte|	message.concat(byte**@keys[:pv_k] % @keys[:hp_k]).chr }
		end
	end

  def prime? num
      (2..Math.sqrt(num)).each { |i| return false if num % i == 0 }
      true
  end
	
	def coprime num
		i = 3		
		while true
			return i if prime?(i) && num % i != 0
			i += 1
		end
	end

	def cal_d_value e, fn
		i = 2
		while true
			return i if (i * e) % fn == 1
			i += 1
		end
	end

	def generate_keys
		p, q = get_prime_nums
		n = p*q
		fn = (p-1)*(q-1)
		e = coprime fn
		d = cal_d_value e, fn
		{hp_k: n, pb_k: e, pv_k: d}
	end

end

input = ARGV[0] || ""

c = Cryptor.new
crypted = c.crypt input
puts "", "Crypted:", crypted
puts "", "Uncrypted:", c.uncrypt(crypted), ""
