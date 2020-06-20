module main

import channel
import time

struct TestStruct {
	id int
}


// Basic perf test to compare with golang channels
fn main() {

	mut ch := channel.new_buffered_channel(1000) or {panic(err)}

	go read_channel(mut ch)

	sw := time.new_stopwatch({})

	c := 1000000

	for i := 0; i<c; i++ {
		// println('write $i')
		mut item := &TestStruct{id: i}
		ch.write(item) or {panic(err)}
	}

	println('$c took ${int(sw.elapsed().milliseconds())} ms. ')


	time.sleep_ms(2000)
}

fn read_channel(mut ch channel.Channel) {
	for {
		ch.read() or {panic(err)}
		// item := &TestStruct(i)
		// println('read $item.id')
		// time.sleep_ms(10)
	}
}


