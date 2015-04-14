In order to encrypt or decrypt a message, you need a public and a private key.
To obtain them, run
ruby rsa_crypt.rb generate

The public key consists of the pair (n,e)
The private key consists of the pair (n,d)

In order to encrypt a message, run
ruby rsa_crypt.rb encrypt <your message> <n> <e>
You will get a Base64-encoded encrypted string.

In order to decrypt the string, feed it into the program by running
ruby rsa_crypt.rb decrypt <string> <n> <d>
