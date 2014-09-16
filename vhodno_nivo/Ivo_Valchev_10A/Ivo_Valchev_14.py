'''
Da se razraboti programa, koiato iziskva ot potrebitelia da vuvede celochisleno

chislo x, kudeto 0<x<10. Da se inicializira masiv ot 10 elementa. Da se nameri 

purvoto chislo N v intervala [0; +bezkrainost) deliashto se na x. Da se nameri sumata na 

vsichki chisla v intervala [0; N] i da se zapishe kato purvi element v masiva. Da se 

nameri vtoroto chislo N' v intervala [0; +bezkrainost) deliashto se na x. Da se nameri sumata 

na vsichki chisla v intervala [0, N'] i da se zapishe kato vtori element v masiva. 

Analogichno da se zapulniat i ostanalite elementi na masiva. Masivut da se izvede 

na standartniia izhod.
'''

while True:
	x = int(raw_input())
	if 0 < x and x <10:
		break

arr = []
counter = 0
i = 0
while counter < 10:
	if i % x == 0:
		counter+=1
		arr.append(sum(range(i+1)))
	
	i += 1
	
print(arr)

