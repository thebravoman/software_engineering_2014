require 'prime'
prime_nums = [2, 3, 5, 11, 13, 17, 19, 23, 29, 31, 39, 41, 43, 47].shuffle!
p=prime_nums.pop()
q=prime_nums.pop()

n=p*q
fn=(p-1)*(q-1)
for e in 3...fn
	if Prime.prime?(e) &&fn%e != 0
		public_key = e
		break
	end
end

for d in 2...1000
	if (d * e) % fn  == 1
		private_key=d
		break
	end
end


puts "public key: #{public_key}"
puts "private key: #{private_key}"

string = "Fingers crossed not to fail"

crypted_array = Array.new
string.each_byte do |c|
	crypted_array << (c^public_key) % n
end

decrypted_array = ''
crypted_array.each do |c|
	decrypted_array += ((c^private_key) % n).chr
end
puts string
puts decrypted_array
