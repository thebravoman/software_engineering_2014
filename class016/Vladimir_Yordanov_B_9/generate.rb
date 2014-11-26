require 'erubis'
require 'securerandom'
require_relative 'task1.rb'
require_relative 'task2.rb'
require_relative 'task3.rb'

<<<<<<< HEAD
numbers = (1..29).to_a
=======
numbers = [ARGV[0], ARGV[1], ARGV[2]]

>>>>>>> ecad50a1c3744c91d32acab19321d58d8ca51297
tasks = [Task1.new, Task2.new, Task3.new]
while numbers.size>0
	tasks.shuffle[0].generate(numbers)
end
