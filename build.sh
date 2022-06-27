#!/bin/bash

function show_help(){
      echo "$package - build gogogo"
      echo " "
      echo "$package [options] application [arguments]"
      echo " "
      echo "options:"
      echo "-h, --help                  show brief help"
      echo "-a, --arch=ARCHITECTURE     specify target architecture (arm65, amd64)"
      echo "-o, --os=OS                 specify OS (linux, darwin)"
      exit 0
}

if test $# -eq 0; then
  show_help
fi

while test $# -gt 0; do
  case "$1" in
    -h|--help)
      show_help
      ;;
    -a)
      shift
      if test $# -gt 0; then
        ARCH=$1
      else
        echo "no architecture specified"
        exit 1
      fi
      shift
      ;;
    --arch*)
      ARCH=`echo $1 | sed -e 's/^[^=]*=//g'`
      shift
      ;;
    -o)
      shift
      if test $# -gt 0; then
        OS=$1
      else
        echo "no OS specified"
        exit 1
      fi
      shift
      ;;
    --os*)
      OS=`echo $1 | sed -e 's/^[^=]*=//g'`
      shift
      ;;
    *)
      printf "Wrong option - read the following...\n\n\n"
      show_help
      ;;
  esac
done

printf "Building for os: $OS, with architecture $ARCH.\n"


cd gogogo
GOOS=$OS GOARCH=$ARCH go build -o ../gogogo-$ARCH-$OS main.go

chmod +x ../gogogo*

printf "Building completed, you may wish to link the binary to gogogo:\n"
printf "   ln -sf gogogo-$ARCH-$OS gogogo\n"

#GOOS=linux GOARCH=amd64 go build -o gogogo-amd64-linux src/main.go
#GOOS=darwin GOARCH=arm64 go build -o gogogo-arm64-darwin src/main.go

# windows	      amd64
# freebsd     	amd64
# linux	        arm64
# linux	        386
# linux         amd64
# darwin        amd64
# darwin        arm64
