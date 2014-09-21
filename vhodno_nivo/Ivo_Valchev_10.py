'''
Da se razraboti programa, koiato iziskva ot potrebitelia da vuvede celochisleno

chislo x, kudeto 0<=x<10. Da se inicializira masiv ot 10 elementa. Da se 

nameriat purvite 10 chisla na Fibonachi v [0; +bezkrainost), koito se deliat na x bez ostatuk. 

Namerenite stojnosti da se zadadat kato stojnosti na elementite v masiva. 

Elementite na masiva da se izvedat na standartniia izhod.
'''

def isFib(n):
	fib1 = fib2 = 1
	
	while n>0 and fib2<n:
		fib2+=fib1
		fib1 = fib2-fib1
		
	if fib2 == n:
		return True
	else:
		return False
	

while True:
	x = int(raw_input())
	if 0 <= x and x < 10:
		break	
		
arr = []
foundFibs = i = 0

while foundFibs < 10:
	if isFib(i) and i % x == 0:
		foundFibs+=1
		arr.append(i)
	
	i+=1
	
print(arr)
