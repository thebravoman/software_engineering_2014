require 'base64'
require_relative 'generate_keys'

def mod_pow base, power, mod
  res = 1
  while power > 0
    res = (res * base) % mod if power & 1 == 1
    base = base ** 2 % mod
    power >>= 1
  end
  res
end

# m ^ e (mod n)
def encrypt message, n, e
  Base64.strict_encode64 message.each_char.map { |c| mod_pow c.ord, e, n }.join('-')
end
 
# c ^ d (mod n)
def decrypt encrypted, n, d
  Base64.strict_decode64(encrypted).split('-').map { |c| mod_pow(c.to_i, d, n).chr Encoding::UTF_8 }.join
end

if ARGV[0] == 'generate'
  n,e,d = generate_key
  puts "Public key: #{n}, #{e}"
  puts "Private key: #{n}, #{d}"
elsif ARGV[0] == 'encrypt'
  message = ARGV[1]
  n = ARGV[2].to_i
  e = ARGV[3].to_i
  p encrypt message, n, e
elsif ARGV[0] == 'decrypt'
  encrypted = ARGV[1]
  n = ARGV[2].to_i
  d = ARGV[3].to_i
  p decrypt encrypted, n, d
end
