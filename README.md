# v-channels
Experimental channels-like support in v

This is a very early testing of an basic channel in V. Currently the implementation is more like a allocation free thread-safe ringbuffer.

- NIX only for now
- Uses a ringbuffer queu for zero allocation
- Uses mutex / conditionals
- Uses voidptr
- Support only buffered channel
- Does not push same messages to all receivers but does support multiple receivers

The aim for V should be to build a "mutex free" channel to scale better. This channel implementation is about 4 times slower than golang 1.14 implementation.
