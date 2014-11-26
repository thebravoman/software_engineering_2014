require_relative 'task.rb'
class Task1 < Task
def init_contexts
context1_1 = {
:task_number=>"1",
:more_or_less=>"more",
:in_what_order=>"ASC",
:format_example=>
"file1,3
file2,10
..
fileN,N",
:expected=>
"32lines.rb,32
sixtyfivelines.rb,65
"
}
context1_2 = {
:task_number=>"1",
:more_or_less=>"less",
:in_what_order=>"DESC",
:format_example=>
"file1,3
file2,10
..
fileN,N",
:expected=>
"forget.rb,11
never.rb,9
"
}
context1_3 = {
:task_number=>"1",
:more_or_less=>"less",
:in_what_order=>"ASC",
:format_example=>
"file1,3
file2,10
..
fileN,N",
:expected=>
"never.rb,9
forget.rb,11
"
}
[context1_1,context1_2,context1_3]
end
def initialize
super 'task1.eruby'
end
end
