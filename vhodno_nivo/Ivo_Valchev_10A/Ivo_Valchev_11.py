'''
Da se razraboti programa, koiato iziskva ot potrebitelia da vuvede chislo x, kudeto

0<x<1. Da se nameri chisloto pi chrez slednoto razvitie v red:

1. 4-4/3+4/5-4/7+4/9-4/11+...4/N. Razvitieto v red spira pri 4/N<x. Poluchenata 

stojnost za pi da se izvede na ekrana.
'''

while True:
	x = float(raw_input())
	if 	0 < x and x < 1:
		break
		
string = "4.0"
n = 3
i = 0

while 4.0/n >= x:
	if i % 2 == 0:
		string+="-"
	else:
		string+="+"
		
	string+="4.0/"+str(n)
	n+=2
	i+=1
	
print(eval(string))


