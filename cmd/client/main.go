package main

import (
	"context"
	"flag"
	"fmt"
	"log"

	"github.com/cloudwego/kitex-examples/hello/kitex_gen/api"
	"github.com/cloudwego/kitex-examples/hello/kitex_gen/api/hello"
	"github.com/cloudwego/kitex/client"
	"go.uber.org/ratelimit"
)

var (
	qps = flag.Int("qps", 5000, "qps")
)

func main() {
	flag.Parse()
	client, err := hello.NewClient("hello", client.WithHostPorts("0.0.0.0:8888"))
	if err != nil {
		log.Fatal(err)
	}
	rl := ratelimit.New(*qps)
	count := 0
	for {
		rl.Take()
		req := &api.Request{Message: fmt.Sprintf("%d", count)}
		count += 1
		resp, err := client.Echo(context.Background(), req)
		if err != nil {
			log.Fatal(err)
		}
		log.Println(resp)
	}
}
