x = y = int(raw_input('X: '))
while x >= y:
    y = int(raw_input('Y: '))

if x%17!=0:
	x += 17-(x%17)

y += 1

print sum(range(x,y,17))
