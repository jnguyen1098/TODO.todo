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
CREAT_MSG="Creating $CURR_PWD/TODO.todo"
EMPTY_MSG="Your TODO.todo list is empty! Congrats!"
HELP_MSG='Manage a directory-specific, line-by-line TODO list

    todo         - print TODO.todo
    todo <text>  - add <text> to bottom of TODO.todo
    todo edit    - edit the TODO.todo directly
    todo do <n>  - delete the <n>th entry off TODO.todo
    todo pt      - pop top TODO entry
    todo pb      - pop bottom TODO entry'

NUM_TESTS=10

desc1="Empty TODO 'hi' entry"
input1="todo hi"
output1="$CREAT_MSG
     1\thi"

desc2="Initializing an empty TODO.todo"
input2='todo'
output2="$CREAT_MSG
$EMPTY_MSG"

desc3="Initialize empty list, push 'hi' and 'bye', delete #1, pt, push 'hi'"
input3='todo
todo "hi"
todo "bye"
todo do 1
todo pt
todo hi'
output3="$CREAT_MSG
$EMPTY_MSG
     1\thi
     1\thi
     2\tbye
     1\tbye
Your TODO.todo list is empty! Congrats!
     1\thi"

desc4="TODO.todo help prompt"
input4="todo help"
output4="$HELP_MSG"

desc5="Attempt to check off empty TODO.todo"
input5="todo do 3"
output5="$CREAT_MSG
$EMPTY_MSG"

desc6="Attempt to pb/pb empty TODO.todo"
input6='
todo pb
todo pt
todo pb
todo pt
todo pb
todo pt'
output6="$CREAT_MSG
$EMPTY_MSG
$EMPTY_MSG
$EMPTY_MSG
$EMPTY_MSG
$EMPTY_MSG
$EMPTY_MSG"

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
#    cat CURR_OUTPUT > ../tmp_out
done
