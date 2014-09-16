'''
Da se razraboti programa, koiato iziskva ot potrebitelia da vuvede celochisleno

chislo x, kudeto 0<x<10. Da se inicializira masiv ot 10 elementa. Da se nameri 

sumata ot vsichki chisla v intervala [0; 1000) deliashti se na x i da se zapishe 

kato purva stojnost v masiva. Da se nameri sumata ot vsichki chisla v intervala 

[0;1000) deliashta se na 2x i da se zapishe kato vtora stojnost v masiva. Analogichno 

da se nameri sumata na vsichki chisla deliashti se na Nx za N v intervala [1;10] i da 

se zapishat kato element N-1 v masiva. Masivut da se izvede na standartniia izhod.
'''

while True:
	x = int(raw_input())
	
	if 0 < x and x < 10:
		break
		
arr = []
counter = 1

while counter <= 10:
	nums = []
	for i in range(1000):
		if i % (x*counter) == 0:
			nums.append(i)
	
	arr.append(sum(nums))
	counter+=1
	
print(arr)
