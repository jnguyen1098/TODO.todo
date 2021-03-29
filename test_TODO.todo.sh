#!/usr/bin/env sh

TODO_TEST="_tmp_TODO.todo_test"
TODOtodo="./TODO.todo.sh"

if [ -d "$TODO_TEST" ]; then
    echo "Test folder remnants remain. Delete and restart"
    exit 1
fi

. "$TODOtodo"

mkdir "$TODO_TEST"

cd "$TODO_TEST"

CURR_PWD="$(pwd)"
echo "Creating $CURR_PWD/TODO.todo" >> test_case_1
echo "     1\thi" >> test_case_1

todo hi > test_case_1_output

diff test_case_1 test_case_1_output

cd ..

rm -rf "$TODO_TEST"
