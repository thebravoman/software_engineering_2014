#Run:

##Generating keys:

**Run:** 
> ***ruby crypter.rb -g p q e***  


**to the command line interpreter**

Where ***p***, ***q*** & ***e*** are the 3 choices wich need to be made for the RSA algorithm.

##Crypting a message:

**Run:** 
> ***ruby crypter.rb -c message pub_key modulus(n)***  


**to the command line interpreter**

Where ***message*** is the message to be crypted, ***pub_key*** is the public key & ***modulus(n)*** is modulus(n) calcolated when the keys were generated.

##Decrypting a message:

**Run:** 
> ***ruby crypter.rb -c message private_key modulus(n)***  


**to the command line interpreter**

Where ***message*** is the crypted message to be derypted, ***private_key*** is the private key & ***modulus(n)*** is modulus(n) calcolated when the keys were generated.

#Example run:

>$ ruby crypt.rb -g 7 13 1  
public key:  
5  
private key:  
29  
n:   
91   
$ ruby crypt.rb -c "ACDC" 5 91  
encrypted message:   
':W:   
$ ruby crypt.rb -d "':W:" 29 91   
decrypted message:   
ACDC  
