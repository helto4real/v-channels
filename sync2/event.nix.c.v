module sync2

#include <pthread.h>


fn C.pthread_cond_init(c &C.pthread_cond_t, m &C.pthread_mutex_t) int
fn C.pthread_cond_wait() int
fn C.pthread_cond_signal(c &C.pthread_cond_t) int


#flag -lpthread

// [init_with=new_mutex] // TODO: implement support for this struct attribute, and disallow Mutex{} from outside the sync.new_mutex() function.
[ref_only]
pub struct Event {
	mut:
	mutex C.pthread_mutex_t
	cond  C.pthread_cond_t
}

pub fn new_event() &Event {
	m := &Event{}
	x := C.pthread_mutex_init(&m.mutex, C.NULL)
	println('x: $x')
	println('cond: $m.cond')
	y := C.pthread_cond_init(&m.cond, C.NULL)
	println('y: $y')
	println('cond: $m.cond')
	return m
}

pub fn (mut m Event) set() {
	z := C.pthread_cond_signal(&m.cond)
	println('z: $z')
}

pub fn (mut m Event) wait() ? {

    // for  {
		if C.pthread_cond_wait(&m.cond, &m.mutex) != 0 {return error("error in waiting for conditional")}
	// }

}

// pub fn (mut m Mutex) unlock() {
// 	C.pthread_mutex_unlock(&m.mutex)
// }
