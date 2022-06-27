package build

import (
	"fmt"
)

func StartBuild(architecture string, os string) {
	fmt.Printf("Starting Build\n")
	fmt.Printf("architecture: %v\n", architecture)
	fmt.Printf("os: %v\n", os)
}
