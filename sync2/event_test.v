import sync2
import time

fn test_set_and_wait() {

	mut ev := sync2.new_event()

	// go do(ev)
	ev.set()
	assert false

	ev.wait() or {panic(err)}

	assert true
}

fn do_set(mut e &sync2.Event) {
	time.sleep_ms(1)
	e.set()
}