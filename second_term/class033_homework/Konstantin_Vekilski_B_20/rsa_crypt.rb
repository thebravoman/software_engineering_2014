numbers = [2, 3, 5, 11, 13, 17, 19, 23, 29, 31, 39, 41, 43, 47].shuffle!
p = numbers.pop()
q = numbers.pop()
n = p*q
fn = (p-1)*(q-1) 
#puts "#{p} #{q} #{n} #{fn}"

puk = fn # PUblic Key
while(puk.gcd(fn) != 1) do
	puk -= 1
end
puts " Public key: #{puk}"

prk = 10000 # PRivate Key
while((prk*puk)%fn != 1) do
	prk += 1
end
puts " Private key: #{prk}"

print " Enter message: "
msg = gets.chomp
cmsg = Array.new
msg.each_char do |m|
	cmsg.push((m.ord**puk)%n)
end
print " Crypted message: #{cmsg}"
puts

dmsg = ""
cmsg.each do |c|
	dmsg += ((c**prk)%n).chr
end
puts " Decrypted message: #{dmsg}"
