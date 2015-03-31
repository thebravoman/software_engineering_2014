require 'prime'

def choose_primes max_prime_value
  first_prime = rand * max_prime_value
  second_prime = rand * max_prime_value
  loop do
    break if first_prime != second_prime
    second_prime = rand * max_prime_value
  end
  both_primes = Prime.first max_prime_value
  [both_primes[first_prime], both_primes[second_prime]]
end

def coprime? a, b
  a.gcd(b) == 1
end

def choose_e phi
  2.upto(phi-1) { |num| return num if coprime? num, phi }
end

def key_generate
  p,q = choose_primes 10000
  n = p * q
  phi = (p-1) * (q-1)
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

def encrypt message, e, n
  message.each_char.map { |c| mod_pow c.ord, e, n }
end

def decrypt encrypted, d, n
  encrypted.map { |c| mod_pow(c, d, n).chr Encoding::UTF_8 }.join
end

ARGV.each do |arg|
  n,e,d = key_generate
  message = arg
  puts "Before encryption: " + message
  c = encrypt message, e, n
  print "Encrypted message: "

  c.each do |bin|
    print bin
  end

  puts
  print "Decrypted message: "
  puts decrypt( c, d, n )
end

puts "Everything encrypted and decrypted... Bye!"