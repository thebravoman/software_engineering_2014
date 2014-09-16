begin
x = gets.to_i
end until x > 0 && x < 100

Nums = []
OddNums = [] 
count = 0

for i in x+1..x+11  
  Nums[i] = i
  if i % 2 == 1
    OddNums[count] = i
    count = count + 1
  end
end

print OddNums