'''
Da se razraboti programa, koyato iziskva ot potrebitelya da vavede dve

tselochisleni chisla, x i y, kadeto x < y. Da se nameri i izvede sumata na chislata 

delyashti se na 17 v interval [x, y].
'''

while True:
	x,y = map(int, raw_input().split())
	if x < y:
		break
		
s = 0

for i in range(x,y+1):
	if i % 17 == 0:
		s+=i
		
print(s)
