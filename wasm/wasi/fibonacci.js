const { readFileSync } = require("node:fs");
const { WASI, init } = require("@wasmer/wasi");

(async () => {
  await init();

  const wasi = new WASI({
    env: {},
    args: [
      "fibonacci",
      "10",
    ],
  });

  const buffer = readFileSync("./fibonacci.wasm");

  const module = await WebAssembly.compile(new Uint8Array(buffer));

  await wasi.instantiate(module, {});

  const exitCode = wasi.start();
  const stdout = wasi.getStdoutString();

  console.log(`${stdout}(exit code: ${exitCode})`);
})();
