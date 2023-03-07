proto-gen-go:
	- protoc --go_out=./../ --go-grpc_out=./../ ./*/*/*.proto

proto-gen-php:
	- protoc --php_out=./../ --grpc_out=./../ --plugin=protoc-gen-grpc=./.hack/grpc_php_plugin ./*/*/*.proto