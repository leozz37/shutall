deps:
	go mod download

test:
	go test ./...

test-coverage:
	go test -v -covermode=count -coverprofile=coverage.out ./...