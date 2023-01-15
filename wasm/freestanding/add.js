const fs = require("fs");
const source = fs.readFileSync("./add.wasm");
const typedArray = new Uint8Array(source);

WebAssembly.instantiate(typedArray, {
  env: {},
}).then((result) => {
  const { add } = result.instance.exports;
  console.log(add(1, 2));
});
