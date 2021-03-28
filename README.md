# TODO.todo
Really simple bash TODO management script

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

## Testing
todofile doesnt exist
  todofile name is directory
    - todo
    - todo help
    - todo edit
    - todo del 3
    - todo pt
    - todo pb
  user does not have permissions for todofile
    - todo
    - todo help
    - todo edit
    - todo del 3
    - todo pt
    - todo pb
  user does have permissions for todofile
    - todo, then delete the file if it exists
    - todo help, then delete the file is it exists
    - todo edit, then delete the file if it exists
    - todo del 3, then delete the file if it exists
    - todo pt, then delete the file if it exists
    - todo pb, then delete the file if it exists
todofile exists
  todofile is empty
    - todo
    - todo edit, then edit the file, then truncate it
    - todo HELLO WORLD, then truncate the file
    - todo del <big number>
    - todo del out of range
    - todo pt
    - todo pb
  todofile is not empty
    - todo
    - todo hello
    - todo edit
    - todo del
    - todo del out of range
    - todo pt
    - todo pb
