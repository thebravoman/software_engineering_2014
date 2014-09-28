'''
Da se razraboti programa, koiato iziskva ot potrebitelia da vuvede celochisleno

chislo x, kudeto 0<=x<10. Da se inicializira masiv ot 10 elementa. Da se nameriat 

purvite 10 stojnosti na funkciiata cos(x) v intervala [0; +bezkrainost), v koito tretata 

cifra sled desetichnata zapetaia e x. Primer pri cos(1) = 0.540302306 tretata 

cifra sled desetichnata zapetaia e 0. Pri cos(2) = -0.416146837 tretata cifra sled 

desetichnata zapetaia e 6. Namerenite stojnosti da se zadadat kato stojnosti na 

elementite v masiva. Elementite na masiva da se izvedat na standartniia izhod.
'''

import math

while True:
	x = int(raw_input())
	if 0 <= x and x < 10:
		break

arr = []
i = counter = 0

while counter < 10:
	if (math.cos(i)*1000) % 10 == x:
		counter +=1
		arr.append(math.cos(i))
		
	i+=1
	
print(arr)
