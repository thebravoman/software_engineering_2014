'''
Da se razraboti programa, koiato iziskva ot potrebitelia da vuvede celochisleno

chislo x, kudeto 0<x<10. Da se inicializira masiv ot 10 elementa. Da se nameri 

purvoto chislo na Fibonachi v intervala [0; +bezkrainost) zavurshvashto na x i da se zapishe 

kato purvi element v masiva. Da se nameri vtoroto chislo na Fibonachi v 

intervala [0; +bezkrainost) zavurshvashto na x i da se zapishe kato vtori element v masiva. 

Analogichno da se nameriat purvite N prosti chisla v intervala [0; +bezkrainost) i da se

zapishat kato element N v masiva. Masivut da se izvede na standartniia izhod.
'''

def isFib(n):
	fib1 = fib2 = 1
	
	while fib2 < n and n > 0:
		fib2+=fib1
		fib1 = fib2-fib1
	if fib2==n:
		return True
	else:
		return False
		
		
while True:
	x = int(raw_input())
	if 0 < x and x < 10:
		break

arr = []
counter = 0
i = 1

while counter < 10:
	if isFib(i) and i % 10 == x:
		arr.append(i)
		counter+=1
	i+=1
	
print(arr)
