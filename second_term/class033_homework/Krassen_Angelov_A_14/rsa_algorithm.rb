
# Copyright ©
# all rights reserved
# Krassen Angelov

def encrypt message_to_encrypt, e, n
  message_array_ascii = Array.new
  encrypted_message = Array.new
  puts "Your program is awesome <3 - Let me try to Encrypt this message!"
  message_to_encrypt.each_byte do |char|
    message_array_ascii << char
  end
  puts "Your message in ascii is: #{message_array_ascii}"
  message_array_ascii.each do |ascii_code|
    encrypted_message << (ascii_code**e) % n
  end
  File.open("transmitter_message.txt", "a") do |content|
    content.puts "Your Encrypted message is: #{encrypted_message}"
  end
  File.open("receiver_message.txt", "a") do |content|
    content.puts "Encrypted message for you is: #{encrypted_message}"
  end
  puts "Your Encrypted message is: #{encrypted_message}"
  encrypted_message
end

def decrypt message_to_decrypt, d, n
  massage_array_ascii = Array.new
  decrypted_message = Array.new
  puts "Your program is awesome <3 - Let me try to Decrypt this message!"
  message_to_decrypt.each do |encrypted_char|
    massage_array_ascii << (encrypted_char**d) % n
  end
  puts "Your message in ascii is: #{massage_array_ascii}"
  massage_array_ascii.each do |ascii_code|
    decrypted_message << ascii_code.chr
  end

  decrypted_message = decrypted_message.join
  File.open("receiver_message.txt", "a") do |content|
    content.puts "The message for you is: #{decrypted_message}"
  end
  puts "Your message after Decrypt is: #{decrypted_message}"
end

# STEP 1 set 'p' and 'q'

def key_find_n p, q # STEP 2 find 'n'
  n = p*q
  File.open("transmitter_key.txt", "a") do |content|
    content.puts "Your 'n' number is: #{n} = #{p}*#{q}"
  end
  return n
end

def key_find_euler p, q # STEP 3 find 'euler'
  euler = (p-1)*(q-1)
  File.open("transmitter_key.txt", "a") do |content|
    content.puts "Your 'euler' number is: #{euler} = (#{p}-1)*(#{q}-1)"
  end
  return euler
end

def key_e_generation euler # STEP 4 find 'e'
  e = 1
  until euler % e != 0
    e = prime("e", 2, euler-1)
    File.open("transmitter_key.txt", "a") do |content|
      content.puts "Your 'e' number is: #{e} (Encryption key)"
    end
    return e
  end
end

def key_d_generation e, euler # STEP 5 find 'd'
  #(e*d) % euler == 1
  fcolumn_frow = euler # first colum, first row = euler
  scolumn_frow = euler # second colum, first row = euler
  fcolumn_srow = e # e
  scolumn_srow = 1 # rest
  #  <Table>
  # euler | euler
  # e     | 1
  File.open("receiver_key.txt", "a") do |content|
    content.puts "These are the results, by each loop to find the decryption key:"
  end
  File.open("receiver_key.txt", "a") do |content|
    content.puts "---------------------------------------"
    content.puts "loop (1)"
    content.puts "first column, first row: #{fcolumn_frow}"
    content.puts "first column, second row: #{fcolumn_srow}"
    content.puts "second column, first row: #{scolumn_frow}"
    content.puts "second column, second row: #{scolumn_srow}"
  end
  i = 2 # index
  while fcolumn_srow > 1

    fcolumn_srow_buff = fcolumn_srow
    scolumn_srow_buff = scolumn_srow

    fcolumn_srow = fcolumn_frow-(fcolumn_frow/fcolumn_srow)*fcolumn_srow # Example: 40-(40/7)*7 = 5
    scolumn_srow = scolumn_frow-(fcolumn_frow/fcolumn_srow_buff)*scolumn_srow # Example: 40-(40/7)*1 = 35

    scolumn_srow = scolumn_srow % euler if scolumn_srow < 0
    # eult

    fcolumn_frow = fcolumn_srow_buff
    scolumn_frow = scolumn_srow_buff
    File.open("receiver_key.txt", "a") do |content|
      content.puts "---------------------------------------"
      content.puts "loop (#{i})"
      content.puts "first column, first row: #{fcolumn_frow}"
      content.puts "first column, second row: #{fcolumn_srow}"
      content.puts "second column, first row: #{scolumn_frow}"
      content.puts "second column, second row: #{scolumn_srow}"
    end
    i += 1
 end

 d = scolumn_srow
 File.open("receiver_key.txt", "a") do |content|
   content.puts "Your 'd' is: #{d} (Decryption key)"
 end
 return d
end

def enter_message
  puts "It's time to enter your message:"
  message = gets.chomp
  File.open("transmitter_message.txt", "a") do |content|
    content.puts "Your message is: #{message}"
  end
  return message
end

def is_prime? number
    return number >= 1 if number <= 3
    return false if number % 2 == 0 || number % 3 == 0
    i = 5
    while i*i <= number
        return false if (number % i == 0 || number % (i + 2) == 0)
        i += 6
    end
    true
end

def prime ordinal, from_random_size, to_random_size
  #puts "Enter your #{ordinal} prime number: "
  #prime_number = gets.chomp.to_i
  prime_number = Random.rand(from_random_size...to_random_size) # => same as rand(10...42)
  until is_prime?(prime_number) == true
    #puts "-----------------------------"
    #puts "Write your #{ordinal} prime number again!"
    #puts " -- -- -- -- -- -- -- -- "
    #puts "Enter your First prime number: "
    #prime_number = gets.chomp.to_i
    prime_number = Random.rand(from_random_size...to_random_size)
  end
  prime_number
end

first_prime = prime("first", 1, 99)
second_prime = prime("second", 1, 99)
puts "---------------------------------------"

File.open("transmitter_key.txt", "w") do |content|
  content.puts "New encryption key"
end

File.open("receiver_key.txt", "w") do |content|
  content.puts "New decryption key"
end

File.open("transmitter_message.txt", "w") do |content|
  content.puts "Your Message"
end

File.open("receiver_message.txt", "w") do |content|
  content.puts "The Message for you"
end

File.open("transmitter_key.txt", "a") do |content|
  content.puts "Your first prime number is: #{first_prime}"
  content.puts "Your second prime number is: #{second_prime}"
end

n = key_find_n(first_prime, second_prime)
euler = key_find_euler(first_prime, second_prime)
e = key_e_generation(euler)
d = key_d_generation(e, euler)

message = enter_message
encrypted_message = encrypt(message, e, n)
decrypt(encrypted_message, d, n)

puts "4 files are created or updated"
puts "  +) transmitter_key.txt"
puts "  +) receiver_key.txt"
puts "  +) transmitter_message.txt"
puts "  +) receiver_message.txt"
