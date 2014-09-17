x = int(raw_input('X: '))

while x<1 or x>9:
    x = int(raw_input('X: '))

a = [0]*10

for a_index in range(10):
    x_multiplied = x*(a_index + 1)
    s = 0       #like sum
    for i in range(1001):
        if i%x_multiplied==0:
            s+=i
                
    a[a_index] = s
        

for i in a:
    print i
