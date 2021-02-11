let packageJson = `
{
  "name": "heya",
  "version": "0.0.1",
  "scripts": {
    "build": "bsb -make-world",
    "clean": "bsb -clean-world",
    "start": "bsb -make-world -w"
  },
  "keywords": [
    "rescript"
  ],
  "author": "",
  "license": "MIT",
  "devDependencies": {
    "bs-platform": "*"
  }
}
`

let bscongifJson = `
{
  "$schema": "https://raw.githubusercontent.com/rescript-lang/rescript-compiler/master/docs/docson/build-schema.json",
  "name": "heya",
  "version": "0.0.1",
  "sources": {
    "dir" : "src",
    "subdirs" : true
  },
  "package-specs": {
    "module": "commonjs",
    "in-source": true
  },
  "suffix": ".bs.js",
  "bs-dependencies": [
  ],
  "warnings": {
    "error" : "+101"
  },
}
`

let demoRes = `
Js.log("Hello, World!")
`

let gitIgnore = `
.DS_Store
/node_modules/
/lib/
.bsb.lock
.merlin
`
