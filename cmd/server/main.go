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

// HelloImpl implements the last service interface defined in the IDL.
type HelloImpl struct{}

// Echo implements the HelloImpl interface.
func (s *HelloImpl) Echo(ctx context.Context, req *api.Request) (resp *api.Response, err error) {
	// TODO: Your code here...
	resp = &api.Response{Message: req.Message}
	log.Println(resp)
	return
}

func main() {
	flag.Parse()
	addr, _ := net.ResolveTCPAddr("tcp", fmt.Sprintf(":%d", *port))
	svr := hello.NewServer(new(HelloImpl), server.WithServiceAddr(addr))

	err := svr.Run()
	if err != nil {
		log.Println(err.Error())
	}
}
