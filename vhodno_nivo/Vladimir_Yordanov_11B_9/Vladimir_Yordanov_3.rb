def isprime(var)
  prime = 0
  for counter in 1..var
      if var % counter == 0
        prime = prime + 1
      end    #if var %
  end        #if counter
    
    if prime == 2
      if var % 10 == 3
        puts var
    end #if var   
  end   #if prime    
end     #for counter

x = gets.to_i
begin
  y = gets.to_i
end until x < y

for i in x..y
  isprime(i)
end
