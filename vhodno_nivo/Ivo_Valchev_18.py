'''
Da se razraboti programa, koiato iziskva ot potrebitelia da vuvede celochisleno

chislo x, kudeto x e intervala [0; +bezkrainost). Da se nameriat purvite 10 nechetni chisla 

deliteli na x i da se zapishat v masiv. Masivut da se izvede na ekrana i da se 

nameriat prostite chisla v tozi masiv.
'''

def isDivisor(i, num):
	if num % i == 0:
		return True
	else:
		return False
		
def isPrime(num):
	for i in range(2, num):
		if num % i == 0:
			return False
			
	return True
			

while True:
	x = int(raw_input())
	if 0 < x:
		break
		
arr = []
counter = 0

i = 2
while counter < 10:
	if isDivisor(i, x):
		arr.append(i)
		counter+=1
	i+=1

print(arr)
arr2 = []
i = len(arr) -1

while i >= 0:
	if isPrime(arr[i]):
		arr2.append(arr[i])
	i-=1

print(arr2)
