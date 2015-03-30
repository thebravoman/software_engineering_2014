numbers=[2, 3, 5, 7, 11, 13,17,19,23,29,31,37,41,43,47].shuffle
p=numbers.pop()
q=numbers.pop()

n=p*q

funcOi=(p-1)*(q-1)
e=2 #Because the first prime number is 2. I don't know if there is logic, but thats how i chose it 
while(1)
	e+=1
	if e>1 && e<funcOi && (e.gcd(funcOi)==1) 
		break
	end
end

puts "Public key: #{e}"

d=2 #Same as for "e"
while(1)
	d+=1
	if ((d*e)%funcOi==1)
		break
	end
end

puts "Private key: #{d}"

#Crypt

string=gets.chomp()
puts "String you typed: " << string

crypted=Array.new()
string.each_char do |new_char|
	new_char=(new_char.ord**e)%n
	crypted << new_char
end

p crypted

#Decrypt

decrypted=String.new()
crypted.each do |decrypt_char|
	decrypt_char=((decrypt_char**d)%n).chr
	decrypted+=decrypt_char
end

p decrypted