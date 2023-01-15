# Compile and run

```sh
zig build-exe -O ReleaseSmall -target wasm32-wasi fibonacci.zig
```

## Using wasmtime

```sh
wasmtime fibonacci.wasm
```

## Using Node

```sh
node fibonacci.js
```
