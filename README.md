# TODO.todo
Simple bash TODO list manager that supports directory-specific TODO lists, push/pop, and line numbers.

## Installation

Add the following line to your `~/.bashrc` file (changing the path as needed).

```bash
if [ -f path/to/TODO.todo.sh ]; then
    . path/to/TODO.todo.sh
fi
```

This will run `TODO.todo.sh` on startup and allow usage of the `todo` command.

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

### Add an entry to your TODO.todo file

```bash
$ todo 'refactor methods'
     1  take a rest
     2  go on a walk
     3  refactor methods
```

```bash
$ todo "fix func issue by next week ($(date --date="-7 days ago"))"
     1  take a rest
     2  go on a walk
     3  refactor methods
     4  fix func issue by next week (Sun 04 Apr 2021 06:36:08 PM EDT)
```

### Delete entry by line number in TODO.todo

```bash
$ todo
     1  take a rest
     2  go on a walk
     3  refactor methods
     4  fix func issue by next week (Sun 04 Apr 2021 06:36:08 PM EDT)
$ todo del 3
     1  take a rest
     2  go on a walk
     3  fix func issue by next week (Sun 04 Apr 2021 06:36:08 PM EDT)
```

### Pop (delete) top-most item in TODO.todo

```bash
$ todo pt
     1  first
     2  second
     3  third
     4  fourth
     5  fifth
$ todo pt
     1  second
     2  third
     3  fourth
     4  fifth
$ todo pt
     1  third
     2  fourth
     3  fifth
```

### Pop (delete) bottom-most item in TODO.todo

```bash
$ todo
     1  first
     2  second
     3  third
     4  fourth
     5  fifth
$ todo pb
     1  first
     2  second
     3  third
     4  fourth
$ todo pb
     1  first
     2  second
     3  third
```

### Edit TODO.todo using an external text editor

```bash
todo edit
# You should now be in the text editor defined in the script
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
