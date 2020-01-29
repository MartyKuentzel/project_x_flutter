# project_x_flutter

My Awesome Flutter Client

## Gnerate new gRPC

protoc --proto_path=lib/core/proto/v1 --plugin=protoc-gen-dart=/c/Users/marty/AppData/Roaming/Pub/Cache/bin/protoc-gen-dart.bat --dart_out=grpc:lib/core/api/v1 lib/core/proto/v1/product-service.proto