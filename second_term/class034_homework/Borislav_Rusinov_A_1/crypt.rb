numbers=[2, 3, 5, 7, 11, 13,17,19,23,29,31,37,41,43,47,53,59].shuffle

p=numbers.pop()
#p p
q=numbers.pop()
#p q

if p!=q 
	n=p*q
	#n=9711453055079
	funcOi=(p-1)*(q-1)
end

e=2 #Because the first prime number is 2. I don't know if there is logic, but thats how i chose it 
while(1)
	e+=1
	if e>1 && e<funcOi && (e.gcd(funcOi)==1) 
		break
	end
end
#p e



def mod_pow base, power, mod
  res = 1
  while power > 0
    res = (res * base) % mod if power & 1 == 1
    base = base ** 2 % mod
    power >>= 1
  end
  res
end

puts "Public key: [#{e},#{n}]"

d=2 
#p funcOi
while(1)
	if (d!=e && (d*e)%funcOi==1)
		break
	end
	d+=1
end
#p d

#235,391
#1227,1927


#103,779
puts "Private key: [#{d},#{n}]"

#Crypt

string=gets.chomp()
puts "String you typed: " << string

crypted= string.each_char.map { |c| mod_pow c.ord, e, n }


p "Crypted: #{crypted}"

#Decrypt

#crypted=[1115, 1425, 9, 472, 1425, 9, 118, 1283, 1425, 1251]
decrypted=crypted.map { |c| mod_pow(c, d, n).chr Encoding::UTF_8 }.join


p "Decrypt: #{decrypted}" 

=begin
ако искам аз да пратя съобщение на някой друг взимам неговия Public key, криптирам съобщението с неговия Public key и му го пращам
ако аз получавам съобщение генерирам мой public key, пращам му го, пазя моя private key, той ми праща
криптирано съобщение и аз го декриптирам с моя private key
=end
