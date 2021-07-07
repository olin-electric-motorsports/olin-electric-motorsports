# Libraries

The code in `libs/` is meant to be reusable libraries that are shared among all
the boards on the vehicle and the projects that are under development. Examples
of these would be

* CAN library
* UART library
* SPI library
* GPIO library

Libraries will each have their own subdirectory like so:

```
libs/
└── example_library
    ├── src_arm/         -> Source files for the ARM library
    ├── src_avr/         -> Source files for the AVR library
    ├── include/api.h    -> Common public header
    ├── test/            -> Unit tests for the library
    └── BUILD            -> Bazel BUILD file
```

## To Do

* Is `src_arm` and `src_avr` the best naming pattern? Probably not. Is there
  something better? The idea is that we have a single common API (defined in
  `include/api.h`) and it is _implemented_ by the different CPU architectures.
