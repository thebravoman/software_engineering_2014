def isPrime(n): #copy-paste from the internet wo :D
    if n < 2:
        return False
    for i in range(2,int(n**0.5)+1):
        if n%i==0:
            return False
    return True


x = int(raw_input('X: '))

while x<1 or x>9:
    x = int(raw_input('X: '))

a = [0]*10
a_index = 0

if x%2!=0:
    while a_index < 10:
        if isPrime(x)==True:
            a[a_index] = x
            a_index += 1
        x += 10

if x==2:
    a[0] = 2

for i in a:
    print i
