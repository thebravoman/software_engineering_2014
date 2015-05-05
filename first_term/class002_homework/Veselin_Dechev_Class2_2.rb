Check = Hash.new
    Dir.glob("C:/Users/hrisi/Desktop/*.*") do |file|
        data = file.split('/').last.split('.').first
        name = data.split('_')[0] + "_" + data.split('_')[1]
      Dir.glob("C:/Users/hrisi/Desktop/#{name}*.*") do |task|
            exercise = exercise +" "+ task.split('_').last.split('.').first
end
    Check["#{name}"] = exercise
    exercise = ""
end
Check.each {|k,v| puts "#{k}#{v}" }
gets
