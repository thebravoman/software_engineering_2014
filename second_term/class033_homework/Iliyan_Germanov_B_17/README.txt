--------------------------------------------------------------------------------------------
INSTRUCTIONS:
I.Encrypting a file:
	1.To encrypt a file first you MUST alredy have created a keyfile.
	  If you don't have a keyfile use the following command:
		`ruby crypt.rb generate_keys keyfile_name`
	2.After creating a keyfile you are ready to encrypt.
	  As first argument pass 'encrypt', as second the path to the file
	  you want to encrypt and as third the path to the keyfile. EXAMPLE:
		`ruby crypt.rb encrypt target_filename path_to_keyfile`
II.Decrypting a file:
	1.To decrypt file you MUST use the keyfile with which the target file was encrypted.
	  USING A DIFFERENT keyfile WILL RUIN THE ENCRYPTED FILE!!!
	2.After having the keyfile with which the file was encrypted.
	  Run the following command:
		`ruby crypt.rb decrypt target_filename path_to_keyfile`
NOTE: 
	Using wrong or corrupted keyfile will destroy your target file!!!
	This script CAN NOT encrypt or decrypt files with different charsets!  
	Trying to decrypt not encrypted file will destroy its content!
---------------------------------------------------------------------------------------------
