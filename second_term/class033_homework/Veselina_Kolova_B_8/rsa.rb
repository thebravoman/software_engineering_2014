require 'prime'

# p q n φ e d
# 0 1 2 3 4 5....
@values = Array.new
@E = 65537

def gcd(value)
	t = rand(80)
	for i in t..value
		if Prime.prime?(i) && value % i != 0 then break end
	end
   return i
end

def chose_keys
	p = 0
	q = 0
	
	until Prime.prime?(p) && Prime.prime?(q) do
		p = rand(100)
		q = rand(100)
	end
	
	@values << p
	@values << q
	@values << p*q
	f = (p-1)*(q-1)
	@values << f			
	e = gcd(f)
	@values << e	
	
	for d in rand(100)..120
		if ((e*d) - 1) % f == 0 then break end
	end 
	
	@values << d
end

def encrypt(m, n)
	m = s_to_n(m)
	mod_pow(m, @E, n)
end

def decrypt(c, n, d)
	m = mod_pow(c, d, n)
	n_to_s(m)
end

def n_to_s(n)
	s = ""
	while(n > 0)
	  s = ( n & 0xFF ).chr + s
	  n >>= 8
	end
	s
end

def s_to_n(s)
	n = 0
	s.each_byte do |b| 
	  n = n * 256 + b 
	end
	n
end

def mod_pow(base, power, mod)
  res = 1
  while power > 0
    res = (res * base) % mod if power & 1 == 1
    base = base ** 2 % mod
    power >>= 1
  end
  res
end

# ----------

M = "I'm sleepless... You got me wide awake"

puts M
chose_keys
c = encrypt(M, @values[2])
dec = decrypt(c, @values[2], @values[5])

puts c
puts dec
