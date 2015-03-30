require 'prime'

def get_keys()
	p = 0
	q = 0
	while ((Prime.prime?(q)) == false) do
		prng = Random.new	
		q = prng.rand(256)
	end
	while ((Prime.prime?(p)) == false) do
		p = prng.rand(256)	
	end

	n = p*q
	
	func = (p-1)*(q-1)
	
	public_key = prng.rand(1..func-1)
	
	private_key = get_private_key_number(func, public_key)
	
	
	[n, func, public_key, private_key]
end

def gcd(a, b)
	return [0,1] if a % b == 0
	x, y = gcd(b, a % b)
	[y, x - y * (a / b)]
end
def get_private_key_number(func, private_key)
	x, y = gcd(private_key, func)
	x += func if x < 0
	x
end

keys = get_keys()
n = keys[0]
puts "n = #{n}"
func = keys[1]
puts ("func = #{func}")
public_key = keys[2]
puts ("public key = #{public_key}")
private_key = keys[3]
puts "private key = #{private_key}"

def crypt(text, public_key, private_key, n)
	crypted_text = Array.new
	text.each_char do |char|
		char = ((char.ord**public_key) %n)
		crypted_text.push(char)
	end
	crypted_text
	#puts crypted_text
end
def decrypt(crypted_text, public_key, private_key, n)
	decrypted_text = String.new
	crypted_text.each do |char|
		dec_char = ((char**private_key) %n).chr
		decrypted_text += dec_char
	end
	puts decrypted_text
end

puts "Enter words to crypt"
text = gets.chomp

begin
	crypt = crypt(text, public_key, private_key, n)
	puts crypt
	decrypt(crypt, public_key, private_key, n)
rescue
	#Second try LOL
	keys = get_keys()
	n = keys[0]
	func = keys[1]
	public_key = keys[2]
	private_key = keys[3]
	crypt = crypt(text, public_key, private_key, n)
	decrypt(crypt, public_key, private_key, n)
end

