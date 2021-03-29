#!/usr/bin/env sh

TODO_TEST="_tmp_TODO.todo_test"
TODOtodo="./TODO.todo.sh"

if [ -d "$TODO_TEST" ]; then
    echo "Test folder remnants remain. Delete and restart"
    exit 1
fi

trap 'cd .. && rm -rf "$TODO_TEST" && exit' 0 2 3 15

. "$TODOtodo"

mkdir "$TODO_TEST"

cd "$TODO_TEST"

CURR_PWD="$(pwd)"
NUM_TESTS=3

desc1="Empty TODO 'hi' entry"
input1="todo hi"
output1="Creating $CURR_PWD/TODO.todo
     1\thi"

desc2="Initializing an empty TODO.todo"
input2='todo'
output2="Creating $CURR_PWD/TODO.todo
Your TODO.todo list is empty! Congrats!"

desc3="Initialize empty list, push 'hi' and 'bye', delete #1, pt, push 'hi'"
input3='todo
todo "hi"
todo "bye"
todo do 1
todo pt
todo hi'
output3="Creating $CURR_PWD/TODO.todo
     1\thi"
output3="Creating $CURR_PWD/TODO.todo
Your TODO.todo list is empty! Congrats!
     1\thi
     1\thi
     2\tbye
     1\tbye
Your TODO.todo list is empty! Congrats!
     1\thi"

desc4="test4"
input4='echo "date"'
output4="this is output 4"

desc5="test5"
input5="ls -laF"
output5="this is output 5"

i=1
while [ "$i" -le "$NUM_TESTS" ]; do
    eval CURR_INPUT=\$input$i
    eval EXP_OUTPUT=\$output$i
    eval TEST_DESC=\$desc$i
    echo "Executing test $i: $TEST_DESC"
    eval "$CURR_INPUT" > CURR_OUTPUT
    echo "$EXP_OUTPUT" > EXP_OUTPUT
    diff CURR_OUTPUT EXP_OUTPUT
    true $((i=i+1))
    rm -rf TODO.todo
#    cat CURR_OUTPUT
done
