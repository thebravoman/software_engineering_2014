def isPrime(n): #copy-paste from the internet wo :D
    if n < 2:
        return False
    for i in range(2,int(n**0.5)+1):
      if n%i==0:
        return False
    return True

x = int(raw_input('X: '))

while x<0:
    x = int(raw_input('X: '))

a = []

if x==1:
    a.append(x)
    
for i in range(1,x,2):
    if x%i==0 and len(a)!=10:
        a.append(i)

for i in a:
    print i

for i in a:
    isPrime(i) #I don't print them, because
               #it isn't written to
