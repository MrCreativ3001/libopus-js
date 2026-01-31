const fs = require("fs")

// Move compiled libopus files
fs.mkdirSync("./dist", { recursive: true })
fs.copyFileSync("./build/libopus.d.ts", "./src/libopus.d.ts")
fs.copyFileSync("./build/libopus.js", "./dist/libopus.js")