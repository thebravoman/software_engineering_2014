require 'prime'
require 'csv'
require 'base64'
def choose_two_primes limit
  rand1 = rand * limit
  rand2 = rand * limit
  loop do
    break if rand1 != rand2
    rand2 = rand * limit
  end
  primes = Prime.first limit
  [primes[rand1], primes[rand2]]
end

def coprime? a, b
  a.gcd(b) == 1
end

def choose_e phi
  2.upto(phi-1) { |num| return num if coprime? num, phi }
end

def generate_key
  p,q = choose_two_primes 10000

  n = p * q
  phi = (p-1) * (q-1)

  # 65537 is a good value, the choose_e method generates a small e and it's not secure
  e = choose_e phi

  d = get_d phi, e

  [n, e, d]
end

def extended_gcd a, b
  return [0,1] if a % b == 0
  x, y = extended_gcd(b, a % b)
  [y, x - y * (a / b)]
end

def get_d phi, e
  x, y = extended_gcd e, phi 
  x += phi if x < 0
  x
end

def mod_pow base, power, mod
  res = 1
  while power > 0
    res = (res * base) % mod if power & 1 == 1
    base = base ** 2 % mod
    power >>= 1
  end
  res
end

# Encryption -> m ^ e (mod n) 
# Decryption c ^ d (mod n)
 
def encrypt message, e, n
  Base64.strict_encode64 message.each_char.map { |c| mod_pow c.ord, e, n }.join('-')
end

def decrypt encrypted, d, n
  encrypted=Base64.strict_decode64(encrypted)
  encrypted=encrypted.split("-")

  encrypted.map { |c| mod_pow(c.to_i, d, n).chr Encoding::UTF_8 }.join
end

#Base64.strict_encode64 message.each_char.map { |c| mod_pow c.ord, e, n }.join('-')

n,e,d = generate_key
# (n,e) = public key
# (n,d) = private key

case ARGV[0]
when 'generate'
	generate_key
	CSV.open("keys.csv","w") do |csv|
		csv << [n]
		csv << [e]
		csv << [d]
	end
	puts("e=",e,"n=",n,"d=",d)
when 'crypt'
	if ARGV[3] == '-f'
		file = ARGV[4]
		if File.exist? file
	  		message = File.read file
		else
	  	exit 1
		end
	else 
		message = ARGV[3]
	end
	e = ARGV[1]
	e=e.to_i
	n = ARGV[2]
	n=n.to_i
	c = encrypt message, e, n
	p "crypt message",c	
	
when 'decrypt'
	all = CSV.read("keys.csv")
	n= all.first.first.to_i
	d= all.last.first.to_i
	c= ARGV[1]		
	p decrypt( c, d, n )
else
  puts "You choose option that is not available"
end























