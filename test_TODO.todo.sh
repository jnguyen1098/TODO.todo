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
NUM_TESTS=5

desc1="Empty TODO 'hi' entry"
input1="todo hi"
output1="Creating $CURR_PWD/TODO.todo
     1\thi"

desc2="test2"
input2="echo 'hi'"
output2="this is output 2"

desc3="test3"
input3='ls'
output3="this is output 3"

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
done
