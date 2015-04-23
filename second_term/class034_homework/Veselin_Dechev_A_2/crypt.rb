require "rsa"
key_pair = RSA::KeyPair.generate(128)
input=gets.chomp
ciphertext = key_pair.encrypt(input)
puts ciphertext
plaintext = key_pair.decrypt(ciphertext)
puts plaintext
