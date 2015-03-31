prime_numbers = [2, 3, 5, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73]

p = prime_numbers.shuffle!.pop()
q = prime_numbers.shuffle!.pop()

n = p*q
etf = (p-1)*(q-1)

e = rand(rand(100))
while(1)
	e+=1
	if e>1 && e<etf && (e.gcd(etf)==1) 
		break
	end
end
puts "Public key: #{e}"

d = 0
while(1)
	d+=1
	if (e*d-1)%etf == 0
		break
	end
end
puts "Private key: #{d}"


string = "Hello world! :)";

encrypt = Array.new()
string.each_char do |char|
	encrypted = (char.ord**e) %n
	encrypt.push(encrypted)
end
p encrypt

decrypt = String.new()
encrypt.each do |char|
	decrypted = ((char**d) %n).chr
	decrypt += decrypted
end
puts decrypt
