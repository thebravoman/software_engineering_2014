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
:format => "csv",
:expected=>
"
F2le2_L9le4_1
F2le2_L9le4_2
F2le2_L9le442_3
F2le4_Last142_4

"
}
context1_2 = {
:task_number=>"1",
:more_or_less => "less",
:letters=>"8",
:which_name=>"second",
:which_to_sort=>"First name",
:in_what_order=>"ASC",
:format => "csv",
:expected=>
"
F2le2_L9le4_1
F2le2_L9le4_2
F2le2_L9le442_3
F2le4_Last142_4
"
}
context1_3 = {
:task_number=>"1",
:more_or_less => "more",
:letters=>"6",
:which_name=>"second",
:which_to_sort=>"First name",
:in_what_order=>"ASC",
:format => "csv",
:expected=>
"
F2le2_L9le442_3
F2le4_Last142_4
"
}
[context1_1,context1_2,context1_3]
end
def initialize
taskNumber = 1
super 'task1.eruby', taskNumber
end
end
