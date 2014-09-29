  c=Array.new(20,0)
  Dir.glob("#{ARGV.first}/**/*.*") do |my_text_file|
  s = my_text_file.split(/_/)
  number= s.last.split(/\./).first
  if number.length < 3
        i=number.to_i
  if i<=20
        c[i]=c[i]+1
    end
    end
    end
  for i in 2..18 do
        print "#{i}"
  if i <18 
        print (",") 
    end
    end
        print("\n")
  for i in 2..18 do
        print "#{c[i]}"
  if i<18
    printf(",")
    end
    end
