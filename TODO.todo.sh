todo() {
    TODOFILE="TODO.todo"
    _EDITOR="$EDITOR"

    if [ "$1" == "help" ]; then
        echo "todo         - print $TODOFILE"
        echo "todo <text>  - add <text> to bottom of $TODOFILE"
        echo "todo edit    - edit the $TODOFILE directly"
        echo "todo del <#> - delete the <#>th entry off $TODOFILE"
        echo 'todo pt      - pop top TODO entry'
        echo 'todo pb      - pop bottom TODO entry'
        return
    fi
    if [ -d "$TODOFILE" ]; then
        echo "$TODOFILE is a directory. Quitting."
        return
    elif [ ! -f "$TODOFILE" ]; then
        echo "Creating $(pwd)/$TODOFILE"
        touch "$TODOFILE"
    fi
    case "$#" in
        0)
            cat -n "$TODOFILE"
            ;;
        1)
            case "$1" in
                "edit")
                    $_EDITOR "$TODOFILE"
                    ;;
                "pt")
                    sed -i '1d' "$TODOFILE"
                    cat -n "$TODOFILE"
                    ;;
                "pb")
                    sed -i '$d' "$TODOFILE"
                    cat -n "$TODOFILE"
                    ;;
                *)
                    echo "$1" >> "$TODOFILE"
                    cat -n "$TODOFILE"
                    ;;
            esac
            ;;
        2)
            case "$1" in
                "del")
                    sed -i "$2d" "$TODOFILE"
                    cat -n "$TODOFILE"
                    ;;
            esac
            ;;
        *)
            echo "Too many arguments"
            ;;
    esac
}