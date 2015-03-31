prime_numbers = [2, 3, 5, 11, 13, 17, 19, 23, 29, 31, 39, 41, 43, 47]

# generate keys
prime_numbers.shuffle!
numbers = prime_numbers.pop(2)

n = numbers[0] * numbers[1]

fn = (numbers[0] - 1) * (numbers[1] - 1)

e = fn

while(1) do
	break if e.gcd(fn) == 1
	e -= 1
end

public_key = e

d = 1000
while(1) do
	break if  (d * e) % fn  == 1
	d += 1
end
private_key =  d
# generate keys

puts "public key: #{public_key}"
puts "private key: #{private_key}"


# crypting
str = "This is a test ..."
crypted = Array.new
str.each_char do |char|
	 cry = (char.ord ** public_key) % n
	 crypted.push(cry)
end

# decrypting
decripted = ""
crypted.each do |char|
	res =  (char ** private_key % n).chr
	decripted += res
end

p decripted


