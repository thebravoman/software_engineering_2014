#Begin
numbers = [2, 3, 5, 11, 13, 17, 19, 23, 29, 31, 39, 41, 43, 47].shuffle!;
p = numbers.pop()
q = numbers.pop()
n = p * q
phiN = (p - 1) * (q - 1) 

e = phiN
while (1) do
	if (e.gcd(phiN) == 1)
		break
	end
	e -= 1
end
puts "#{e} - Public Key";

d = 5
while (1) do
	d += 1 
	if ((d * e) %phiN == 1) 
		break
	end
end
puts "#{d} - Private Key";

string = "John Doe just goes to church and drink a lil beer";

#Encrypt
#crypted = (5**e) %n
cryptedString = Array.new()
string.each_char do |char|
	cryptedChar = (char.ord**e) %n
	cryptedString.push(cryptedChar)
end
p cryptedString

#Decrypt
#decrypt = (e**d) %n
decryptedString = String.new()
cryptedString.each do |char|
	decryptedChar = ((char**d) %n).chr
	decryptedString += decryptedChar
end

puts decryptedString
