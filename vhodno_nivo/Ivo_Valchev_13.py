'''
Da se razraboti programa, koiato iziskva ot potrebitelia da vuvede celochisleno

chislo h, kudeto 0<x<10. Da se inicializira masiv ot 10 elementa. Da se nameri 

sumata ot cos(z) za vsiako z v intervala [0;x) i da se zapishe kato purvi element v 

masiva. Da se nameri sumata ot cos(z) za vsiako z v intervala [x; 2x) i da se zapishe 

kato vtori element v masiva. Analogichno da se nameriat sumite na cos(z) za vsichki 

intervali [Nx; (N+1)x ) i da se zapishat kato element N v masiva za vsiako N v 

intervala [0, 10). Masivut da se izvede na standartniia izhod.
'''

import math

def cosSum(start, end):
	s=0
	for i in range(start,end):
		s+=math.cos(i)
		
	return s

while True:
	x = int(raw_input())
	if 0 < x and x < 10:
		break
		
arr = []

i = start = 0
end = x

while i < 10:
	arr.append(cosSum(start,end))
	print("Interval ("+str(start)+","+str(end)+"); Cos: " + str(arr[i]))
	start = end
	end*=2
	i+=1
