'''
Da se razraboti programa, koiato iziskva ot potrebitelia da vuvede celochisleno

chislo x, kudeto 0<x<10. Da se inicializira masiv ot 10 elementa. Da se nameri 

purvoto prosto chislo v intervala [0; +bezkrainost) zavurshvashto na x i da se zapishe kato 

purvi element v masiva. Da se nameri vtoroto prosto chislo v intervala [0; +bezkrainost) 

zavurshvashto na x i da se zapishe kato vtori element v masiva. Analogichno da se 

nameriat purvite N prosti chisla v intervala [0; +bezkrainost) i da se zapishat kato element 

N v masiva. Masivut da se izvede na standartniia izhod.
'''

def isPrime(num):
	prime = True
	for i in range(2,num):
		if num % i == 0:
			prime = False
			break
	return prime
	

while True:
	x = int(raw_input())
	if 0 < x and x < 10:
		break
		
arr = []
i = 1
counter = 0

while counter < 10:
	if isPrime(i) and i % 10 == x:
		arr.append(i)
		counter+=1
	i+=1
print(arr)
	
