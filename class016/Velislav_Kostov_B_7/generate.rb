require 'erubis'
require 'securerandom'
require_relative 'task1.rb'

numbers = (1..29).to_a
tasks = [Task1.new]
while numbers.size>0
	tasks.shuffle[0].generate(numbers)
end
