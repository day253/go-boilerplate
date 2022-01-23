package main

import (
	"fmt"
	"net/http"
)

func indexHandler(w http.ResponseWriter, r *http.Request) {
	_, err := fmt.Fprintf(w, "hello world")
	if err != nil {
		return
	}
}

func main() {
	http.HandleFunc("/", indexHandler)
	if err := http.ListenAndServe(":8000", nil); err != nil {
		return
	}
}
