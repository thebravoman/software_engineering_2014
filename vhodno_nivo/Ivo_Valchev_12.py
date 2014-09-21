#Modified first fit algorithm; chooses between vertical and horizontal;

'''
Da se razraboti programa, koiato iziskva ot potrebitelia da vuvede chetiri chisla

x, y, w, h kudeto x>0, y>0, w>0, h>0. CHisloto x e dulzhinata na plocha durvesina, 

a chisloto y e visochinata. Da se opredeli na kolko celi plochi s razmeri w, h 

mozhe da se razrezhe goliamata plocha. Da se inicializira masiv ot 10 elementa. 

Stojnostite na elementite na masiva da sa purvite 10 koordinati po dulzhina na 

plochata, v koito tia triabva da se razrezhe, za da se poluchat po-malkite plochi.
'''

def getDimensions(x,y,w,h):
	
	lowerBound = (x/w)*(y/h)
	arr = []
	posX = posY = 0
	i = 0
	
	if x/w < y/h:
		#horizontal
		temp = w
		w = h
		h = temp
		
		temp = x
		x = y
		y = x
		
	while i<10 and i < lowerBound:
		for j in range(x/w):
			arr.append([posX,posY])
			posX += w
			i += 1
			
		posY += h
		posX = 0	
			
	return arr
	

while True:
	x, y,w, h = raw_input().split()
	x = int(x)
	y = int(y)
	w = int(w)
	h = int(h)
	
	if x > 0 and y > 0 and w > 0 and h > 0:
		break
	
arr = []
arr = getDimensions(x,y,w,h)
print(arr)


