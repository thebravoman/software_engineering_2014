require 'prime'

class RSA
	def initialize
		privateKey=0
		while @publicKey==nil
			begin
				p = rand(15);	
			end while ( !Prime.prime?(p) or p==0)
			begin
				q = rand(15);	
			end while ( !Prime.prime?(q) or q==0 or q==p)
			@n=p*q
			totient = (p-1)*(q-1)
			j = []
			for i in 2..totient-1
				j <<i if i.gcd(totient) == 1
			end
			@publicKey = j[rand(j.length)]
		end
		begin
			privateKey+=1
		end while ((privateKey*@publicKey)%totient)!=1
		@privateKey=privateKey
	end

	def getN
		@n
	end

	def getPublicKey
		@publicKey
	end

	def getPrivateKey
		@privateKey
	end

	def setValues n, s, d
		@n = n
		@publicKey = s
		@privateKey = d
	end

	def encrypt (key, divisor, value)
		result = String.new
		value.each_byte do |e|
			result << ((e**key)%divisor)
		end
		result
	end

	def decrypt value 
		result = String.new
		value.each_byte do |e|
			result << (((e)**@privateKey).modulo(@n))
		end
		result
	end
end