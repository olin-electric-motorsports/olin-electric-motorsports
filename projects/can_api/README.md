# can_api

# TODOs

As of 10/25:

- Convert current address space to mini-YAML files
- Write full DBC-generator
- Implement reserved Message ID handling (make a YAML with reserved IDs)
- Preserve unchanged IDs unless specific override is passed when doing priority
  assignments
- Implement TX message handling
  - Append TX message definitions to generated mini-yamls
  - Create TX message DBC definition
- Cleanup, resolve all relative paths and make artifacts have a consistent
  folder to live in
- Add documentation and docstrings
- Make sure that generated can_api.c can compile and run
- then test with a hackerboard
