require_relative 'task.rb'
class Task1 < Task
def init_contexts
context1_1 = {
:task_number=>"1",
:more_or_less => "more",
:letters=>"3",
:which_name=>"first",
:which_to_sort=>"First name",
:in_what_order=>"ASC",
:expected=>
"
Denis,Stoinev
Dimitar,Matev
Emiliqn,Sokolov
Gergan,Nikolov

"
}
context1_2 = {
:task_number=>"1",
:more_or_less => "less",
:letters=>"8",
:which_name=>"second",
:which_to_sort=>"First name",
:in_what_order=>"ASC",
:expected=>
"
Denis,Stoinev
Dimitar,Matev
Emiliqn,Sokolov
Gergan,Nikolov
"
}
context1_3 = {
:task_number=>"1",
:more_or_less => "more",
:letters=>"6",
:which_name=>"second",
:which_to_sort=>"First name",
:in_what_order=>"ASC",
:expected=>
"
Dimitar,Matev
Emiliqn,Sokolov
"
}
[context1_1,context1_2,context1_3]
end
def initialize
taskNumber = 1
super 'task1.eruby', taskNumber
end
end
