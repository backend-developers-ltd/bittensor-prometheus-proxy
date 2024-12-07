These files were created by:

1. checking out submodules of this repository (prometheus and protobuf)
2. Installing go and a bunch of stuff I'm not sure is necessary
3. Running `make proto` in prometheus's root dir until the error was `--gogofast_out: protoc-gen-gogofast: Plugin failed with status code 1.` - not sure if that was necessary
4. running `protoc -I=. -I=../../protobuf --python_out=. ../../protobuf/gogoproto/gogo.proto types.proto remote.proto` in `prometheus/prompb`
5. ...
6. profit

