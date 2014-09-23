acceptable_extensions = [ '.c', '.cpp', '.rb', '.py', '.java', '.html' ]
hash = Hash.new { |hash, key| hash[key] = Array.new }
dir_path = ARGV[0]
Dir.glob("#{dir_path}*/*") do |file|
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
  sum = 0
  value.sort!.each do |i| 
    print "#{i},"
    sum += i 
  end
  puts sum
end
