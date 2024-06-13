package main

import (
	"flag"
	"fmt"
	"log"
	"net"

	api "github.com/cloudwego/kitex-examples/hello/kitex_gen/api/hello"
	"github.com/cloudwego/kitex/server"
)

var (
	port = flag.Int("port", 8888, "port")
)

func main() {
	addr, _ := net.ResolveTCPAddr("tcp", fmt.Sprintf(":%d", *port))
	svr := api.NewServer(new(HelloImpl), server.WithServiceAddr(addr))

	err := svr.Run()
	if err != nil {
		log.Println(err.Error())
	}
}
