# can_api

# TODOs

As of 10/25: For this PR:

- Write full DBC-generator [x]
- Cleanup, resolve all relative paths and make artifacts have a consistent
  folder to live in [x]
- Add documentation and docstrings
- Complete main script MVP
- Make sure that generated can_api.c can compile and run

Later PRs:

- Convert current address space to mini-YAML files
- Implement reserved Message ID handling (make a YAML with reserved IDs)
- Preserve unchanged IDs unless specific override is passed when doing priority
  assignments
- Implement RX message handling
  - Append RX message definitions to generated mini-yamls
- test C code with a hackerboard
