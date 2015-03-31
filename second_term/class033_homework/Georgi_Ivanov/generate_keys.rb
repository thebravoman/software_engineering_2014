#ruby generate_keys.rb "text to encrypt and decrypt"
 
require 'rubygems'
require 'rsa'
 
key_pair = RSA::KeyPair.generate(1024)
 
#File.write('public.txt', key_pair.public_key)
#File.write('private.txt', key_pair.private_key)
 
#p key_pair.public_key
#p key_pair.private_key
 
p "Encrypted:" , ciphertext = key_pair.encrypt(ARGV[0])
p "Decrypted:" , plaintext = key_pair.decrypt(ciphertext)
