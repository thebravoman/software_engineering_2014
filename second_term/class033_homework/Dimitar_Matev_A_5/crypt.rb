require 'prime'

def rand_prime 
	n=0
	while 1
		n = Random.rand(128)
		if(Prime.prime?(n))
			return n
			break
		end
	end
end

def extended_gcd a, b 
	return [0,1] if a % b == 0
	x, y = extended_gcd( b, a % b )
	[y, x - y * (a / b)]
end

def get_d p, q, e
	t = (p - 1) * (q - 1)
	x, y = extended_gcd( e, t ) 
	x += t if x < 0
	x
end

def generate_key
	p=0
	q=0
	d=0
	#1) Choose two distinct prime numbers p and q. 
	p = rand_prime 
	q = rand_prime 
	#2) Compute n = pq. 
	n = p*q
	#3) f = n - (p + q -1) Oiler
	f = n - (p + q -1)
	#4)	Choose an integer e such that 1 < e < φ(n)
	е = 65537
	#5)Determine d as d ≡ e−1 (mod φ(n))
	d = get_d p, q, е

	[n, е, d]
end

def encrypt m, n, e
	#m = m.to_i
	i=0
	arr = Array.new
	m.each_byte do |v|
    	arr[i]= (v ** e) % n
    	i+=1
	end
	#m = m ** e
	#m % n
	arr
end

def decrypt c, n, d
	i=0
	str=""
	c.each do |v|
    	str << (v ** d) % n 
    	i+=1
	end
	str
	#c = c ** d
	#c = c % n
	#c.to_s
end

n,e,d = generate_key

m = "The Fast And The Furious is a great movie!"

puts "public exponent: #{e}"  
puts "public modulus : #{n}"
puts "private exp    : #{d}"  

puts ""
puts "Message        : %s" % m
puts ""

c = encrypt m, n, e

puts "Encrypted      : "
c.each do |v|
	puts v
end 
puts ""
dec = decrypt c, n, d
puts "Decrypt again  : #{dec}" 




 
