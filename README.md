# TODO.todo
Really simple bash TODO management script

## Installation

To have the `todo` command available on startup, add the following line to your `~/.bashrc` file (changing the path as you see fit).

```bash
if [ -f path/to/TODO.todo.sh ]; then
    . path/to/TODO.todo.sh
fi
```

This will run `TODO.todo.sh` on startup, which defines the environment variables
and functions necessary for it to run.

The `if [ -f path/to/TODO.todo.sh ]; then . . . fi` part is just bash syntax for
checking if the file exists (just in case something happens to the script).

## Usage
```
Manage a directory-specific, line-by-line TODO list

    todo         - print TODO.todo
    todo <text>  - add <text> to bottom of TODO.todo
    todo edit    - edit the TODO.todo directly
    todo del <n> - delete the <n>th entry off TODO.todo
    todo pt      - pop top TODO entry
    todo pb      - pop bottom TODO entry
```

## Examples

### Initialize a TODO.todo in a directory

```bash
$ cd my_directory
$ todo
Creating path/to/TODO.todo
Your TODO.todo list is empty! Congrats!
```

### Edit TODO.todo using an external text editor

```bash
todo edit
# You should now be in the text editor defined in the script
```

### Append plain text to bottom of TODO.todo

```bash
$ todo 'refactor methods'
     1  take a rest
     2  go on a walk
     3  refactor methods
```

### Append interpolated text to bottom of TODO.todo

```bash
$ todo "fix func issue by next week ($(date --date="-7 days ago"))"
     1  take a break
     2  go on a walk
     3  refactor functions
     4  fix func issue by next week (Sun 04 Apr 2021 06:36:08 PM EDT)
```

### Delete a line in TODO.todo

```bash
$ todo
     1  take a break
     2  go on a walk
     3  refactor functions
     4  fix func issue by next week (Sun 04 Apr 2021 06:36:08 PM EDT)
$ todo del 3
     1  take a break
     2  go on a walk
     3  fix func issue by next week (Sun 04 Apr 2021 06:36:08 PM EDT)
```

## License

```
MIT License

Copyright (c) 2021 Jason Nguyen

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```
