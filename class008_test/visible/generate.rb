require 'erubis'
require 'securerandom'
require_relative 'task1.rb'
require_relative 'task2.rb'
require_relative 'task3.rb'

numbers = (1..29).to_a
tasks = [Task1.new, Task2.new, Task3.new]
while numbers.size>0
	tasks.shuffle[0].generate(numbers)
end
