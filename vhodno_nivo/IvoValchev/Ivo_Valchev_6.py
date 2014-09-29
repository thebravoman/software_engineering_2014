'''
Da se razraboti programa, koyato iziskva ot potrebitelya da vavede tselochisleno

chislo x, kadeto 0<x<10. Da se initsializira masiv ot 100 tselochisleni elementa.

Stoynostite na elementite da sa sluchayni chisla v intervala [0, 100). Elementite

na masiva da se podredyat taka, che chislata zavarshvashti na x da sa v nachaloto.
'''

from random import randint

while True:
	x = int(raw_input())
	if 0 < x and x < 10:
		break
		
arr = []	
for i in range(100):
	arr.append(randint(0,100))


mov = 0
for i in range(len(arr)):
	if arr[i] % 10 == x:
		temp = arr[i]
		arr[i] = arr[mov]
		arr[mov] = temp
		mov += 1
		
print(arr)
	
