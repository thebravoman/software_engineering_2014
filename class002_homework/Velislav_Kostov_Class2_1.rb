solved_tasks = Array.new(19,0)
Dir.glob("/home/nesc/Documents/TechnologyOfProgramming/Repository/software_engineering_2014/vhodno_nivo/*.*") do |filename|
    s = filename.split(/_/).last.split(/\./).first
    s.each_char{|c| s.delete!(c) if c.ord < 48 or c.ord > 57}
    if s.to_i > 0 and s.to_i < solved_tasks.size then
        puts s
        solved_tasks[s.to_i - 1] += 1
    end
end

1.upto(solved_tasks.size) do |i|
    puts "#{i},#{solved_tasks[i - 1]}"
end
