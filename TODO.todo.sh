#!/usr/bin/env sh

TODO_FILE="TODO.todo"
TODO_EDITOR="vim"
EMPTY_TODO_LIST_MESSAGE="Your TODO.todo list is empty! Congrats!"

print_todo_file() {
    if [ "$(wc -l < "$1")" -eq 0 ]; then
        echo "$EMPTY_TODO_LIST_MESSAGE"
    else
        cat -n "$1"
    fi
}

print_todo_help() {
    echo "Manage a directory-specific, line-by-line TODO list"
    echo ""
    echo "    todo         - print $TODO_FILE"
    echo "    todo <text>  - add <text> to bottom of $TODO_FILE"
    echo "    todo edit    - edit the $TODO_FILE directly"
    echo "    todo del <n> - delete the <n>th entry off $TODO_FILE"
    echo "    todo pt      - pop top TODO entry"
    echo "    todo pb      - pop bottom TODO entry"
}

todo() {
    if [ "$1" = "help" ]; then
        print_todo_help
        return
    fi

    if [ -d "$TODO_FILE" ]; then
        echo "$TODO_FILE is a directory. Quitting."
        return
    elif [ ! -f "$TODO_FILE" ]; then
        echo "Creating $(pwd)/$TODO_FILE"
        if ! touch "$TODO_FILE"; then
            echo "Couldn't create $TODO_FILE. Quitting"
            return
        fi
    fi

    case "$#" in
        0)
            print_todo_file "$TODO_FILE"
            ;;
        1)
            case "$1" in
                "edit")
                    "$TODO_EDITOR" "$TODO_FILE"
                    ;;
                "pt")
                    sed -i '1d' "$TODO_FILE"
                    print_todo_file "$TODO_FILE"
                    ;;
                "pb")
                    sed -i '$d' "$TODO_FILE"
                    print_todo_file "$TODO_FILE"
                    ;;
                *)
                    echo "$1" >> "$TODO_FILE"
                    print_todo_file "$TODO_FILE"
                    ;;
            esac
            ;;
        2)
            case "$1" in
                "del")
                    sed -i "$2d" "$TODO_FILE"
                    print_todo_file "$TODO_FILE"
                    ;;
            esac
            ;;
        *)
            print_todo_help
            ;;
    esac
}

