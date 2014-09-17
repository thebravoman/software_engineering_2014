x = int(raw_input('X: '))

while x<1 or x>9:
    x = int(raw_input('X: '))

a = [0]*10

a[0] = sum(range(x+1))
for i in range(1,10):
    a[i] = sum(range(x*i+1, x*(i+1)+1))+a[i-1]
    #I've explained that complicated thing below

for i in a:
    print i


# i first wrote
# for i in range(1,11):
#    a[i-1] = sum(range(i*x+1))
# which sums from 0 to N every time it runs, so
# 1st time - 0 to N, second time 0 to N' , etc.

# but this code is faster because the 1st time
# it sums from 0 to N, but the second time it
# sums from N+1 to N' and adds the first sum
# (0 to N) to it and so on.
