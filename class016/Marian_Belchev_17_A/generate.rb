require 'erubis'
require 'securerandom'
require_relative 'task1.rb'
require_relative 'task2.rb'
#require_relative 'task3.rb'

number = [ARGV[0], ARGV[1], ARGV[2]]

tasks = [Task1.new, Task2.new]
number.sort.each do |generate|
	tasks.shuffle[0].generate(number)
end