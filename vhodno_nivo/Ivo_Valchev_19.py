'''
Da se razraboti programa, koiato iziskva ot potrebitelia da vuvede chislo x, kudeto

x e intervala (0;1). Da se nameri sumata ot sbora na reciprochnite stojnosti za 

vseki dve twin primes. Razvitieto da produlzhi dokato otnoshenieto ne stane po-

malko to x.
'''

def isPrime(num):
	for i in range(2, num):
		if num % i == 0:
			return False
			
	return True


while True:
	x = float(raw_input())
	if 0 < x and x < 1:
		break
		

s = 0.0
i = 1
while True:
	
	if x >= 1.0/(2*i+2):
		break
	
	if isPrime(i) and isPrime(i+2):
		s+= 1.0/(2*i+2)
	i+=1
	
print(s)
