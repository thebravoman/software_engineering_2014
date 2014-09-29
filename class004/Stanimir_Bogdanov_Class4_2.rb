acceptable_extensions = [ '.c', '.cpp', '.rb', '.py', '.java', '.html' ]
hash = Hash.new { |hash, key| hash[key] = Array.new }
dir_path = ARGV[0]
Dir.glob("#{dir_path}/**/*.*") do |file|
  extension = file.split('/').last.split('.').last
  fields = file.split('/').last.split('.').first.split('_')
  if acceptable_extensions.include?('.' + extension)
    if fields.length == 3 
      first_name = fields[0]
      last_name = fields[1]
      problem_num = fields[2]
      unless first_name.empty? || last_name.empty? || problem_num.empty? 
        if problem_num.to_i.to_s == problem_num && 
          problem_num.to_i > 1 && problem_num.to_i < 19 
            unless hash[first_name+'_'+last_name].include? problem_num.to_i
              hash[first_name+'_'+last_name].push problem_num.to_i
            end
        end
      end
    end
  end 
end
Hash[hash.sort].each do |key, value|
  print "#{key.split('_').first} #{key.split('_').last},"
  sum = 0
  value.sort.each do |i| 
    print "#{i},"
    sum += i 
  end
  puts sum
end
