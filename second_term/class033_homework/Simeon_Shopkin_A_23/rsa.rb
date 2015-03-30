def is_prime(n)
    return n > 1 if n <=3
    return false if n % 2 == 0 || n % 3 == 0
 
    i = 5
    while i*i <= n 
        return false if (n % i == 0 || n % (i + 2) == 0)
        i += 6
    end
 
    true	
end

	


r=25
while !is_prime(r)
	r=rand(200000)
end	
a=r	 

r=25
while !is_prime(r)
	r=rand(200000)
end
b=r
	n=b*a
	p=(a-1)*(b-1)
	e=rand(1..p) #publicKey
	d=0 #privateKey
	def gcd(a, b)
		return [0,1] if a % b == 0
		d, y = gcd(b, a % b)
		[y, d - y * (a / b)]
	end
	
	def privatekey(p, e)
		d, y = gcd(e, p) 
		d += p if d < 0
		d	
	end

	
	string="bla bla"
	string=string.to_i
	h=(string**e)%n
	puts(h)
	b=(h**d)%n
	puts(b)




