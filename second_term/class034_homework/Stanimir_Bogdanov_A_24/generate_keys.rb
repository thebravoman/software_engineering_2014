require 'prime'

class Integer
  # This method to check for primes is not 100% reliable, but almost.
  # Advantage: speed
   def prime?
     n = self.abs
     return true if n == 2
     return false if n == 1 || n & 1 == 0
     return false if n > 3 && n % 6 != 1 && n % 6 != 5

     d = n-1
     d >>= 1 while d & 1 == 0
     20.times do
       a = rand(n-2) + 1
       t = d
       y = Integer.mod_pow( a, t, n )
       while t != n-1 && y != 1 && y != n-1
         y = (y * y) % n
         t <<= 1
       end
       return false if y != n-1 && t & 1 == 0
     end
     return true
   end

   # a^b mod c , using much quicker squaring-method
   # check out https://en.wikipedia.org/wiki/Modular_exponentiation
   # for more information.
   def self.mod_pow( base, power, mod )
     res = 1
     while power > 0
       res = (res * base) % mod if power & 1 == 1
       base = base ** 2 % mod
       power >>= 1
     end
     res
   end
end

def random_prime( bits )
      p "generating radn prime with #{bits} bits"
      begin
        n = random_number( bits )
        return n if n.prime?
      end while true
    end

    # Concatenate string (begins and ends with 1)
    # to get desired length and an uneven value.
    def random_number( bits )
      m = (1..bits-2).map{ rand() > 0.5 ? '1' : '0' }.join
      s = "1" + m + "1"
      s.to_i( 2 )
    end

def choose_two_primes limit
  rand1 = rand * limit
  rand2 = rand * limit
  loop do
    break if rand1 != rand2
    rand2 = rand * limit
  end
  primes = Prime.first limit
  [primes[rand1], primes[rand2]]
  # [random_prime(64), random_prime(64)]
  # [(Prime.first 100000).shuffle[50000],(Prime.first 100000).shuffle[50000]]
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
  e = 65537 #choose_e phi

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

generate_key