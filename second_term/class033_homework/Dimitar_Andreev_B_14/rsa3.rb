class Integer
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

class RSA
  E = 65537

  class << self

    def generate_keys( bits )
      n, e, d = 0
      p = random_prime( bits )
      q = random_prime( bits )
      n = p * q
      d = get_d( p, q, E )
      [n, E, d]
    end

    def encrypt( m, n )
      m = s_to_n( m )
      Integer.mod_pow( m, E, n )
    end

    def decrypt( c, n, d )
      m = Integer.mod_pow( c, d, n )
      n_to_s( m )
    end

    private

    def n_to_s( n )
      s = ""
      while( n > 0 )
        s = ( n & 0xFF ).chr + s
        n >>= 8
      end
      s
    end
    
    def s_to_n( s )
      n = 0
      s.each_byte do |b| 
        n = n * 256 + b 
      end
      n
    end

    def random_prime( bits )
      begin
        n = random_number( bits )
        return n if n.prime?
      end while true
    end

    def random_number( bits )
      m = (1..bits-2).map{ rand() > 0.5 ? '1' : '0' }.join
      s = "1" + m + "1"
      s.to_i( 2 )
    end

    def phi( a, b )
      (a - 1) * (b - 1)
    end

    def extended_gcd( a, b )
      return [0,1] if a % b == 0
      x, y = extended_gcd( b, a % b )
      [y, x - y * (a / b)]
    end

    def get_d(p, q, e)
      t = phi( p, q )
      x, y = extended_gcd( e, t ) 
      x += t if x < 0
      x
    end
  end
end

n,e,d = RSA.generate_keys( 256 )

m = "The Fast And The Furious is a great movie!"

puts "public exponent: %x" % e
puts "public modulus : %x" % n
puts "private exp    : %x" % d

puts ""
puts "Message        : %s" % m
puts ""

c = RSA.encrypt( m, n )

puts "Encrypted      : %x" % c
puts ""
puts "Decrypt again  : %s" % RSA.decrypt( c, n, d )
