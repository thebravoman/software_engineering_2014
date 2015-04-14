require './cryptosystem.rb'

def show_menu
	puts "1. Generate Keys Only"
	puts "2. Encrypt message with given key"
	puts "3. Decrypt message"
	puts "4. Haaaaaalp\n\n"
end

def get_choice
	print "Enter your choice: "
	choice = gets.chomp
	case choice
		when '1'
			keys = RSA.generate_keys
			RSA.print_keys(keys[0], keys[1], keys[2])
		when '2'
			print "Enter e: "
			e = gets.chomp
			print "\nEnter n: "
			n = gets.chomp
			print "\nEnter message: "
			message = gets.chomp
			encrypted_message = RSA.encrypt(message, e , n)
			puts "Encrypted message: #{encrypted_message}"
		when '3'
			keys = RSA.generate_keys
			RSA.print_keys(keys[0], keys[1], keys[2])
			print "Enter your encrypted message here: "
			encrypted_message = gets.chomp
			decrypted_message = RSA.decrypt(parse_encrypted_input(encrypted_message), keys[1], keys[2])
			puts "Decrypted message: #{decrypted_message}"
		when '4'
			puts "No halp for ya! Mwahahahahahah"
			puts "Bye, bye!"
	end
end

def parse_encrypted_input(string)
	string.delete "["
	string.delete "]"
	string.delete " "
	string.split(",")
end

show_menu
get_choice
