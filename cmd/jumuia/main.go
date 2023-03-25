package main

import (
	"log"

	"github.com/jumuia/jumuia/internal/server"
)

func main() {
	cfg := server.Config{}
	log.Fatal(server.Run(&cfg))
}
