# Vehicle Software

This folder will hold all of the software that runs on the vehicle. This may
mean the code that runs on the boards, but also any supporting software,
libraries, and other code. Libraries that are board-specific will go under the
board's subfolder.

For example, if we have a board called the ABC, it will have this structure:

```
└── software/
    └── abc/
        ├── src
        │   └── main.c
        ├── BUILD
        └── libs/
            └── specific_library/
```
