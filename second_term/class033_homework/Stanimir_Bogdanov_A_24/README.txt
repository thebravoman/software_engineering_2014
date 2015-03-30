ruby rsa_crypt.rb [args]

Pass a string as a command-line argument to encrypt and decrypt it.
e.g.
ruby rsa_crypt.rb "hello world"

If you use the -f switch, you can provide a file to be encrypted and decrypted.
e.g.
ruby rsa_crypt.rb -f foo.txt

If the file doesn't exist, the program halts with an error code of 1.