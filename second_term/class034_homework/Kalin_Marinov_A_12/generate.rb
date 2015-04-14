class Generate

	def initialize
		generate_keys
	end

	def generate_keys
		p, q = get_prime_nums
		n = p*q
		fn = (p-1)*(q-1)
		e = coprime fn
		d = cal_d_value e, fn
		puts "n = #{ n }, e = #{ e }, d = #{ d }"
	end

	private

	def prime? num
	  (2..Math.sqrt(num)).each { |i| return false if num % i == 0 }
	  true
	end
	
	def cycle_while &condition
		iteration = 3		
		loop do
			return iteration if condition.call iteration
			iteration += 1
		end
	end

	def coprime num
		cycle_while { |number| prime?(number) && num % number != 0 }
	end

	def cal_d_value e, fn
		cycle_while { |number| (number * e) % fn == 1 }
	end

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

end
