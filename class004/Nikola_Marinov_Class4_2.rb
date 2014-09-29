ec = Hash.new{|ime,task| ime[task] = []}
suma = Hash.new{}
checker = 0

Directfile = ARGV[0]
Dir.glob(Directfile + "/**/*") do |my_text_file| 
dot = false	
name = my_text_file.split('/').last.split(Directfile)
 if "#{name}".include? "."
dot = true
 end 
name = name.last.split('.')
name = name.first.split("_")
zadacha =  name[2].to_i
 if zadacha == '' || name[0] == '' || name[1] == ''
next
 else
 if ["2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18"].include? "#{zadacha}"
 if dot == true
name[0] = name[0].capitalize
name[1] = name[1].capitalize
zadacha = zadacha.to_i
 if !suma["#{name[0]} #{name[1]}"]
checker = 0
 end
ec["#{name[0]} #{name[1]}"] << zadacha
checker += zadacha.to_i
suma["#{name[0]} #{name[1]}"] = checker
 end
 end
 end
 end
ec.sort.each{ |kly4,stst| 
print "#{kly4}," 
stst = stst.sort.uniq
stst.each{ |task| 
print "#{task},"
  }
print suma["#{kly4}"]
puts "\n"
  }