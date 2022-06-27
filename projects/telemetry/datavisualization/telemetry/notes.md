Problems

1. Delineating messages from the radios
2. Interpreting those messages on the computer
MVP, just tell humans to plug in the receiving radio first and transmitting radio second. 
3. 


To test:

create a string of binary (8*8, 64 0s and 1s). This will be one message.
Chisel off pieces of 8 numbers, convert to the number it corresponds to
use current workflow to interpret it.




4/10: the current solution I have is this.

We'll repeatedly append to a datafile that will also eventually serve as a log. 
`library.py` will pull the piece of data as soon as it's appended, ideally
The only question/problem I have with this is whether things will actually fit together the way I want.
    example: if two messages are written before `library.py` pulls the data, then it won't pull the message I actually want

4/15: So that doesn't work. I now do a nextmessage.txt file that gets overwritten every time and a log file that just exists as messages are written.

4/20: But why doesn't it work with a radio? I'm doing the same process with the radio file. In fact, that should function *exactly* the same. Whyyyyy.