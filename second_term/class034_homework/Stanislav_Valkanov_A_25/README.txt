1. Run the program with "ruby crypt.rb ..."
2. Method encrypt - encrypts input message 
   Also prints public key, modulus(n), private key(d)
-> ruby crypt.rb encrypt message

3. Method decrypt - decrypts message with given crypted message, modulus(n), private key(d) 
   ARGV[1] = crypted message
   ARGV[2] = modulus
   ARGV[3] = private key
-> ruby crypt.rb decrypt 171746834638240 53493709295092463 3692083788615465
