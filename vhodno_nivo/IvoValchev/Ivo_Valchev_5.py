'''
Da se razraboti programa, koyato iziskva ot potrebitelya da vavede tselochisleno

chislo, x, kadeto 0 < x < 10. Da se initsializirat masiva ot 10 elementa. 

Stoynostite na elementite na masiva da sa ravni na kosinus ot indeksa na 

elementa. Da se izvede masivat, sled koeto da se sortira v nizhodyasht red i otnovo 

da se izvede.
'''

import math

while True:
	x = int(raw_input())
	if 0 < x and x < 10:
		break
		
arr = []

for i in range(x): 
	arr.append(math.cos(i))
	
print(arr)
arr.sort()
print(arr)
