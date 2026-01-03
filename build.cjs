const fs = require("fs")

// Move compiled libopus files
fs.mkdirSync("./dist")
fs.copyFileSync("./build/libopus.d.ts", "./src/libopus.d.ts")
fs.copyFileSync("./build/libopus.js", "./dist/libopus.js")
fs.copyFileSync("./build/libopus.wasm", "./dist/libopus.wasm")