package main

import (
	"bytes"
	"flag"
	"fmt"
	"log"
	"os"
	"os/exec"
	"path"
)

func usage() {
	fmt.Fprintf(os.Stderr, "Usage: %s [options] conf src\n", path.Base(os.Args[0]))
	fmt.Fprintf(os.Stderr, "https://foosoft.net/projects/homemaker/\n\n")
	fmt.Fprintf(os.Stderr, "Parameters:\n")
	flag.PrintDefaults()
}

func main() {
	cmd := exec.Command("git", "status", "-s")
	var out bytes.Buffer
	cmd.Stdout = &out
	err := cmd.Run()
	if err != nil {
		log.Fatal(err)
	}
	if out.String() == "" {
		fmt.Printf("all cool BD")
		os.Exit(0)
	}
	fmt.Printf("there is some changes!")
}
