acceptable_extensions = [ '.c', '.cpp', '.rb', '.py', '.java', '.html' ]
hash = Hash.new { |hash, key| hash[key] = Array.new }
Dir.glob('/home/stamaniorec/software_engineering_2014/vhodno_nivo/*/*') do |file|
  extension = file.split('/').last.split('.').last
  fields = file.split('/').last.split('.').first.split('_')
  if acceptable_extensions.include?('.' + extension)
    first_name = fields[0]
    last_name = fields[1]
    problem_num = fields[2]
    unless first_name.nil? or last_name.nil? or problem_num.nil? or fields.length > 3
      problem_num.delete!('/[a-zA-Z]/')
      hash[first_name+'_'+last_name].push problem_num.to_i
    end
  end 
end
hash.each do |key, value|
  print "#{key.split('_').first.capitalize} #{key.split('_').last.capitalize},"
  value.sort!
  sum = 0
  (value.length-3).upto(value.length-1) do |i|
    print "#{value[i]}," unless i < 0
    sum += value[i]
  end
  puts sum
end
