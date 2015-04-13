Encryption/Decryption homework: Generates Public/Private key pair; 
The program itself could be run by typing **ruby encrypt.rb** in the command line, but would not function properly until one of the following arguments is not submitted as well:
*generate pubkey* - generates and prints the generated public key;
*operate* - operate supports multiple subarguments. Here they are:
- message - This argument is apprising the program, that the following argument is going to be the message we would like to encrypt. Note: the message should not contain spaces, because they are interpreted from the CLI as separate arguments.
- pubkey - This argument is notifying that a public key would be provided from the user and the program itself is not supposed to generate one. Note: the usage of the pubkey argument means, that the program is not going to decrypt the encrypted message, because of the lack of private key.