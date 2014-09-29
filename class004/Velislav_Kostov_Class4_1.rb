solved_tasks = Array.new(17,0)
Dir.glob(ARGV[0] + "/**/*.*") do |filename|
    if not filename.split(/_/).last.split(/\./).last.include?("~")
        s = filename.split(/_/).last.split(/\./).first
        s.each_char{|c| s.delete!(c) if c.ord < 48 or c.ord > 57}
        solved_tasks[s.to_i - 2] += 1 if s.to_i > 1 and s.to_i < 19
    end
end

2.upto(18) {|i| print "#{i}"; print "," if i < 18}

puts

0.upto(solved_tasks.size - 1) {|i| print "#{solved_tasks[i]}"; print "," if i < solved_tasks.size - 1}

puts
