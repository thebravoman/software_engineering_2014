'''
Da se razraboti programa, koyato iziskva ot potrebitelya da vavede tselichisleno

chislo x, kadeto 0<x<100. Da se initsializira masiv ot 10 tselochisleni elementa, 

vseki edin >x. Vseki 2-ri element da se zapishe v nov masiv s razmer 5. 

Polucheniyat masiv da se izvede na ekrana.
'''

from random import randint
import sys

while True:
	x = int(raw_input())
	if 0 < x and x < 100:
		break
		
arr = []
arr2 = []
for i in range(10):
	arr.append(randint(x, sys.getsizeof(int)))
	if i % 2 == 0:
		arr2.append(arr[i])
print(arr2)
