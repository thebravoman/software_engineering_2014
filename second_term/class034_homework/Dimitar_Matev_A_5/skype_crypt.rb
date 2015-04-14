require 'rubygems'
require "skype"
require 'thread'
require 'prime'


#___________________________________________________

def rand_prime 
	n=0
	while 1
		n = Random.rand(128)
		if(Prime.prime?(n))
			return n
			break
		end
	end
end

def extended_gcd a, b 
	return [0,1] if a % b == 0
	x, y = extended_gcd( b, a % b )
	[y, x - y * (a / b)]
end

def get_d p, q, e
	t = (p - 1) * (q - 1)
	x, y = extended_gcd( e, t ) 
	x += t if x < 0
	x
end

def generate_key
	p=0
	q=0
	d=0
	#1) Choose two distinct prime numbers p and q. 
	p = rand_prime 
	q = rand_prime 
	#2) Compute n = pq. 
	n = p*q
	#3) f = n - (p + q -1) Oiler
	f = n - (p + q -1)
	#4)	Choose an integer e such that 1 < e < φ(n)
	е = 65537
	#5)Determine d as d ≡ e−1 (mod φ(n))
	d = get_d p, q, е

	[n, е, d]
end

def encrypt m, n, e
	i=0
	arr = Array.new
	m.each_byte do |v|
    	arr[i]= (v ** e) % n
    	i+=1
	end
	arr
end

def decrypt c, n, d
	i=0
	str=""	
	c.each do |v|
    	str << (v ** d) % n 
    	i+=1
	end
	str
end

#___________________________________________________


Skype.config :app_name => "my_skype_app"

def print_message chat,last_message,skype_name
	if(last_message != chat.messages.last.to_s.split("<").last) #&& chat.messages.last.to_s.split("<").last.split(">").first == skype_name ) 
		puts current_message = chat.messages.last.to_s.split("<").last
		last_message = chat.messages.last.to_s.split("<").last
	end
	last_message
end	

def print_decrypted_message chat,last_message,skype_name
	if(last_message != chat.messages.last.to_s.split("<").last) #&& chat.messages.last.to_s.split("<").last.split(">").first == skype_name ) 
		current_message = chat.messages.last.to_s.split("<").last
		puts current_message = decrypt(current_message,n,d)
		last_message = chat.messages.last.to_s.split("<").last
	end
	last_message
end	

def send_message chat,message
	if(message != nil && message != "exit skype")
		chat.post message	
	end
end

def send_public_key chat,message,n,e
	puts "in function"
	if(message != nil && message != "exit skype")
		message = "PUBLIC_KEY?!"
		chat.post message
		#problemi nadolu
		sleep(2)
		puts message = "N" + n + "N"
		chat.post message
		sleep(2)	
		puts message = "E" + e + "E"
		chat.post message
		puts "Done"
	end
end

def send_crypt_message chat,message,n_pub,e_pub
	if(message != nil && message != "exit skype")
		message = encrypt message,n_pub,e_pub
		chat.post message	
	end
end

def chat_exists skype_name,user
	if(user)
		chat = user
	else
		puts "No user found"
	end
	chat
end

puts "Enter skype name: "
skype_name= gets.chomp
puts "Note: To exit skype, just type -> exit skype "

chat = chat_exists skype_name,Skype.chats.find{|c| c.members.include? skype_name}

puts last_message = chat.messages.last.to_s.split("<").last # print just the message
n,e,d = generate_key
message = nil
crypted_read = false
crypted_write = false
while(1)

	Thread.start do
		message = gets.chomp
		if(message == "send key")
			puts "sending key"
			send_public_key chat,message,n,e
			crypted_write = true
		end
		if(message == "exit skype")
			Thread.list.each do |thread|
				thread.exit unless thread == Thread.current
			end
			exit
		end
		if crypted_read && crypted_write
			send_crypt_message chat,message,n_pub,e_pub
		end
		if !crypted_write || !crypted_read
			send_message chat,message
		end
	end

	if !crypted_read || !crypted_write
		last_message = print_message chat,last_message,skype_name
	end
	if crypted_read && crypted_write
		print_decrypted_message chat,last_message,skype_name
	end
	#receve public key
	if last_message.split(" ")[1] == "PUBLIC_KEY?!" && last_message.split(">").first == skype_name
		puts "WE are in the first if"
		sleep(3) # 3
		last_message = print_message chat,last_message,skype_name
		puts n_pub = last_message.split("N")[1]	
		sleep(2) # 2
		last_message = print_message chat,last_message,skype_name
		puts e_pub = last_message.split("E")[1]
		crypted_read = true
	end
	#_________

	Thread.list.each do |thread|
		thread.exit unless thread == Thread.current
	end
end


