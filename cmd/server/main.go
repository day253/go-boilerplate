package main

import (
	"context"
	"flag"
	"fmt"
	"log"
	"net"

	"github.com/cloudwego/kitex-examples/hello/kitex_gen/api"
	"github.com/cloudwego/kitex-examples/hello/kitex_gen/api/hello"
	"github.com/cloudwego/kitex/server"
)

var (
	port = flag.Int("port", 8888, "port")
)

type helloImpl struct{}

func (s *helloImpl) Echo(ctx context.Context, req *api.Request) (resp *api.Response, err error) {
	resp = &api.Response{Message: req.Message}
	log.Println(resp)
	return
}

func main() {
	flag.Parse()
	addr, _ := net.ResolveTCPAddr("tcp", fmt.Sprintf(":%d", *port))
	svr := hello.NewServer(new(helloImpl), server.WithServiceAddr(addr))
	err := svr.Run()
	if err != nil {
		log.Println(err.Error())
	}
}
