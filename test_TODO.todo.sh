#!/usr/bin/env sh

TODO_TEST="_tmp_TODO.todo_test"
TODOtodo="./TODO.todo.sh"

if [ -d "$TODO_TEST" ]; then
    echo "Test folder remnants remain. Delete and restart"
    exit 1
fi

trap 'rm -rf "$TODO_TEST"' 0 2 3 15

. "$TODOtodo"

mkdir "$TODO_TEST"

cd "$TODO_TEST"

CURR_PWD="$(pwd)"
NUM_TESTS=1

input1="todo hi"
output1="Creating $CURR_PWD/TODO.todo
     1\thi"

input2="this is test 2"
output2="this is output 2"

input3="this is test 3"
output3="this is output 3"

input4="this is test 4"
output4="this is output 4"

input5="this is test 5"
output5="this is output 5"

i=1
while [ "$i" -le "$NUM_TESTS" ]; do
    eval CURR_INPUT=\$input$i
    eval EXP_OUTPUT=\$output$i
    eval "$CURR_INPUT" > CURR_OUTPUT
    echo "$EXP_OUTPUT" > EXP_OUTPUT
    diff CURR_OUTPUT EXP_OUTPUT
    true $((i=i+1))
done

#CURR_PWD="$(pwd)"
#echo "Creating $CURR_PWD/TODO.todo" >> test_case_1
#echo "     1\thi" >> test_case_1

#todo hi > test_case_1_output

#diff test_case_1 test_case_1_output

cd ..

