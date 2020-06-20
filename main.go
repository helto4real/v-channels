package main

import "fmt"
import "log"
import "time"

type TestStruct struct {
	id int
}

func main() {
	ch := make(chan TestStruct, 1000)

	c := 1000000

	go read_channel(ch)

	start := time.Now()

	for i:=0; i<c; i++ {
		ts := &TestStruct{id: i}
		ch <- *ts
	}

	elapsed := time.Since(start)
	fmt.Printf("done")

	log.Printf("%s took %s", c, elapsed)
}

func read_channel(ch chan TestStruct) {

	for {
		<-ch
		// time.Sleep(time.Millisecond)
	}
}
