require_relative 'task.rb'
class Task1 < Task
def init_contexts
context1_1 = {
:task_number=>"1",    
:tag=>"Bad",
:expected=>"Bad1"
}
context1_2 = {
:task_number=>"1",
:tag=>"Good",
:expected=>"Good1"
}
context1_3 = {
:task_number=>"1",
:tag=>"Great",
:expected=>"Great1"
}
context1_4 = {
:task_number=>"1",    
:tag=>"Awesome",
:expected=>"Awesome1"
}
[context1_1,context1_2,context1_3,context1_4]
end
def initialize
super 'task1.eruby'
end
end 
