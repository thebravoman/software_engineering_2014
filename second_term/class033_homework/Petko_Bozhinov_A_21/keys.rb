require 'prime'

class Keys

	@@x = 0
	@@y = 0

	def generate_public_private n, e, d
		a = e.modulo n
		b = d.modulo n
		return a, b
	end

	def inverse a, n
		t = 0
		new_t = 1
		r = n
		new_r = a
		while new_r != 0 do
			quotient = r.div new_r
			t = new_t
			new_t = t - quotient * new_t
			r = new_r
			new_r = r - quotient * new_r
		end
		if t < 0
			t = t + n
		end
		t
	end

	def choose_coprime_integer n 
		random_digit = rand(n)
		while random_digit.gcd(n) != 1 do 
			random_digit = rand(n)
		end
		random_digit
	end

	def check_if_in_correct_order first_digit, second_digit
		if first_digit > second_digit
			c = first_digit
			first_digit = second_digit
			second_digit = c
		end
		return first_digit, second_digit
	end

	def prime_number_generate
		begin 
			random_digit = rand(100)
		end while (Prime.instance.prime?(random_digit)) != true and random_digit != 1
		random_digit
	end

	def generate
		n = 0
		while n <= 0 do 
			first_digit = prime_number_generate
			second_digit = prime_number_generate
			first_digit, second_digit = check_if_in_correct_order first_digit, second_digit
			n = first_digit * second_digit
			n = n - (first_digit + second_digit - 1)
		end
		e = choose_coprime_integer n
		d = inverse(e, n)
		public_key, private_key = generate_public_private n, e, d
		return public_key, private_key
	end

	def get_x
		@@x
	end

	def get_y
		@@y
	end

	def initialize
		@@x, @@y = generate
	end

end