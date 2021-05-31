![Demonstration of TODO.todo](https://s4.gifyu.com/images/pL3lJFI8l6.gif)

# 📝 TODO.todo

Simple bash TODO list manager that supports directory-specific TODO lists, push/pop, and line numbers.

## Installation

Add the following line to your `~/.bashrc` file (changing the path as needed).

```bash
if [ -f path/to/TODO.todo.sh ]; then
    . path/to/TODO.todo.sh
fi
```

This will run `TODO.todo.sh` on startup and allow usage of the `todo` command.

## Commands (`todo help`)

```lang-plaintext
Manage a directory-specific, line-by-line TODO list

    todo         - print TODO.todo
    todo <text>  - add <text> to bottom of TODO.todo
    todo edit    - edit the TODO.todo directly
    todo do <n>  - delete the <n>th entry off TODO.todo
    todo pt      - pop top TODO entry
    todo pb      - pop bottom TODO entry
```

## Usage

### Initialize a TODO.todo in a directory

```bash
$ cd my_directory
$ todo
Creating path/to/TODO.todo
Your TODO.todo list is empty! Congrats!
```

### Add an entry to your TODO.todo file

```bash
$ todo
     1  take a rest
     2  go on a walk
$ todo 'refactor methods'
     1  take a rest
     2  go on a walk
     3  refactor methods
```

```bash
$ todo
     1  take a rest
     2  go on a walk
     3  refactor methods
$ todo "fix func issue by next week ($(date --date="-7 days ago"))"
     1  take a rest
     2  go on a walk
     3  refactor methods
     4  fix func issue by next week (Sun 04 Apr 2021 06:36:08 PM EDT)
```

### Add an entry without escaping quotes (dangerous! spicy!)

```bash
$ todo
     1  take a rest
     2  go geocaching
$ todo play some doom
     1  take a rest
     2  go geocaching
     3  play some doom
```

```bash
$ todo
     1  take a rest
$ todo fix func issue by next week `date --date="-7 days ago"`
     1  take a rest
     2  fix func issue by next week Sun 04 Apr 2021 06:36:08 PM EDT
```

### Check off entry by line number in TODO.todo

```bash
$ todo
     1  take a rest
     2  go on a walk
     3  refactor methods
     4  fix func issue by next week (Sun 04 Apr 2021 06:36:08 PM EDT)
$ todo do 3
     1  take a rest
     2  go on a walk
     3  fix func issue by next week (Sun 04 Apr 2021 06:36:08 PM EDT)
```

### Check off top-most entry in TODO.todo

```bash
$ todo
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

### Check off bottom-most entry in TODO.todo

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

## Testing

I have included a very simple automated testing script to verify outputs.
