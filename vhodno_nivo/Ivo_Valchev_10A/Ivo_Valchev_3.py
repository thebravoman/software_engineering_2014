'''
Da se razraboti programa, koyato iziskva ot potrebitelya da vavede dve

tselochisleni chisla, x i y, kadeto x < y. Da se nameryat i izvedat vsichki prosti 

chisla zavarshvashti na 3 v interval [x,y].
'''

while True:
	x,y = map(int, raw_input().split())
	if x < y:
		break
		
for i in range(x,y+1):
	for j in range(2,i):
		if i % j == 0:
			break
	else:
		if i % 10 == 3:
			print(i)
