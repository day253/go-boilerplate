package main

import (
	"context"
	"flag"
	"log"

	"github.com/cloudwego/kitex-examples/hello/kitex_gen/api"
	"github.com/cloudwego/kitex-examples/hello/kitex_gen/api/hello"
	"github.com/cloudwego/kitex/client"
	"go.uber.org/ratelimit"
)

var (
	qps = flag.Int("qps", 100, "qps")
)

func main() {
	flag.Parse()
	client, err := hello.NewClient("hello", client.WithHostPorts("0.0.0.0:8888"))
	if err != nil {
		log.Fatal(err)
	}
	rl := ratelimit.New(*qps)
	req := &api.Request{Message: "my request"}
	for {
		rl.Take()
		resp, err := client.Echo(context.Background(), req)
		if err != nil {
			log.Fatal(err)
		}
		log.Println(resp)
	}
}
