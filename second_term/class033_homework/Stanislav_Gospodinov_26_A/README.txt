To use objects of this class you should require RSA.rb
Making new object generate public and private key.
To encrypt with external public key use 'encrypt' method with this key as first argument, n of this object as second argument and informationt that you want to encrypt.
Example:
	r1 = RSA.new
	r2 = RSA.new
	encrypted = r1.encrypt(r2.getPublicKey, r2.getN, "my String")
To decrypt use decrypt use 'decrypt' method with encrypted value as argument
Example:
	r1.decrypt encripted