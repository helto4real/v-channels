import sync2
import time

struct TestStruct {
	some_int int
}
fn main() {
	// q := channel.new_queue<TestStruct>()
	mut ev := sync2.new_event()

	// go do(mut &ev)

	println("waiting for event")

	ev.wait() or {panic(err)}

	println("wait is over")
}

fn do(mut e &sync2.Event) {
	time.sleep_ms(1000)
	e.set()
}