require 'erubis'
require 'securerandom'
require_relative 'task1.rb'
require_relative 'task2.rb'
require_relative 'task3.rb'

numbers = [ARGV[0], ARGV[1], ARGV[2]]

tasks = [Task1.new, Task2.new, Task3.new]
numbers.sort.each do
	tasks.shuffle[0].generate(numbers)
end
