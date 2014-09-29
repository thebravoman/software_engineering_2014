'''
Da se razraboti programa, koyato iziskva ot potrebitelya da vavede dve

tselochisleni chisla, x i y, kadeto x < y. Da se nameryat i izvedat vsichki chisla na 

Fibonachi v intervala [x, y].
'''

def isFib(n):
	fib1 = fib2 = 1
	
	while fib2 < n:
		fib2+=fib1
		fib1 = fib2-fib1
	if fib2==n:
		return True
	else:
		return False

while True:
	x,y = map(int, raw_input().split())
	if x < y:
		break
		
for i in range(x,y+1):
	if isFib(i):
		print(i)
		

		
