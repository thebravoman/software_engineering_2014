require 'erubis'
require 'securerandom'
require_relative 'task1.rb'
require_relative 'task2.rb'

numbers = [ARGV[0], ARGV[1], ARGV[2]]
tasks = [Task1.new, Task2.new]
while numbers.size>0
	tasks.shuffle[0].generate(numbers)
end
#numbers.each do
#	task.shuffle[0].generate(numbers)
#end
