require 'mathn'
require 'csv'

E = 65537

def random_prime 
	begin
		r = rand(10000000)
		return r if r.prime?
	end while true
end

def mod_pow(base, power, mod)
  result = 1
  power = power.to_i
  mod = mod.to_i
  while power > 0
    result = (result * base) % mod if power & 1 == 1
    base = (base * base) % mod
    power >>= 1;
  end
  result
end

def extended_gcd(a, b)
  last_remainder, remainder = a.abs, b.abs
  x, last_x, y, last_y = 0, 1, 1, 0
  while remainder != 0
    last_remainder, (quotient, remainder) = remainder, last_remainder.divmod(remainder)
    x, last_x = last_x - quotient*x, x
    y, last_y = last_y - quotient*y, y
  end
  return last_remainder, last_x * (a < 0 ? -1 : 1)
end
 
def get_d(e, et)
  g, x = extended_gcd(e, et)
  if g != 1
    raise 'The maths are broken!'
  end
  x % et
end

def generate_keys 
	p = random_prime
	q = random_prime
	n = p*q
	z = (p - 1) * (q - 1)      
  d = get_d(E,z)
  puts "Public: #{E} #{n}"
  puts "Private: #{d} #{n}"
	[n,E,d]
end


def encr(str, n, e)
  crypted = Array.new
  str.each_char do |char|
    num = char.ord
     cry =  mod_pow(num, e, n)
     crypted.push(cry)
  end
  crypted
end

def decr(crypted, n, d)
  decrypted = ""
  crypted.each do |char|
    res =mod_pow(char, d, n)
    res = res.chr
    decrypted += res
  end
  decrypted
end
# E n - public
# n d - private

first = ARGV[1]
second = ARGV[2]
message = ARGV[3]

case ARGV[0]
when 'generate'
 keys = generate_keys
  CSV.open("keys.csv", "wb") do |csv|
    csv << keys
  end
when 'encrypt'
  puts "Encrypted:"
  p encrypted = encr(message, first, second)

  CSV.open("encrypt.csv", "wb") do |csv|
    csv << encrypted
  end

when 'decrypt'
  text = CSV.read("decrypt.csv")
  text.flatten!.map! { |s| s.to_i }
  puts decrypted = decr(text, first, second)
else
  puts "Error my friend."
end


# ------------------------------------------------------
# # Getting User Input
#   m = gets.chomp
# # Generating Public and Private Keys
#   keys = generate_keys
# #Encrypting message
#   encrypted = encr m, keys
# # Print encrypted
#   puts "Encrypted: #{encrypted}"
# # Decrypting message
#   decrypted = decr encrypted, keys
# # Printing decrypted message
#   puts "Decrypted: #{decrypted}"