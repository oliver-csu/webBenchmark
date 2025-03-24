@echo off
SET CGO_ENABLED=0
SET GOOS=linux
SET GOARCH=amd64
go build -o webBenchmark_linux_x64
SET GOOS=linux
SET GOARCH=arm
go build -o webBenchmark_linux_arm
SET GOOS=windows
SET GOARCH=amd64
go build -o webBenchmark_x64.exe

docker build -t pcdndownloader .

CGO_ENABLED=0 GOOS=windows GOARCH=amd64 go build -o webBenchmark_x64.exe
CGO_ENABLED=0 GOOS=windows GOARCH=386 GOHOSTARCH=386 go build -o webBenchmark_x86.exe
CGO_ENABLED=0 GOOS=linux GOARCH=arm GOHOSTARCH=386 go build -o webBenchmark_linux_arm32
CGO_ENABLED=0  GOOS=darwin GOARCH=amd64 go build -o webBenchmark_osx_x64
CGO_ENABLED=0  GOOS=linux GOARCH=amd64 go build -o webBenchmark_linux_amd64