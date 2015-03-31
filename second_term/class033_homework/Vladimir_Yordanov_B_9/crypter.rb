def is_prime(n)
	return n  > 1 if  n <= 3
	return false if n % 2 == 0 || n % 3 == 0
	
	i = 5
		while i*i <= n
			return false if (n % i == 0 || n % (i + 2) == 0)
			i+= 6
		end
	
	true 
end

def get_public_key()
	begin  prime_one = rand(5...500) end while !is_prime(prime_one)
	begin  prime_two = rand(5...500) end while !is_prime(prime_two)
	$n = prime_one * prime_two
	$euler_num = (prime_one - 1)*(prime_two  - 1)
	begin $e = rand(3..500) end while !is_prime($e) && $euler_num % $e != 0 && $e < $euler_num # public key 
	d = ($e ** -1 % $euler_num) #private_key
	
	return $e
end

def get_private_key() 
	return ($e ** - 1).modulo($euler_num)
end

def encrypt(string, public_key)
	crypted_string = Array.new
	string.each_char do |char|
		crypted_char = (char.ord ** public_key).modulo($n)
		crypted_string.push(crypted_char)
	end

	return crypted_string.join(" ")
end

public_key = get_public_key()
puts stringtest = "Snape is the half blood prince and he killed Dumbledore"
puts "Public key: #{public_key}"
puts encrypt( stringtest, public_key )


