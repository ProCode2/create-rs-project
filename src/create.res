// process.cwd()
@scope("process") @val external cwd: unit => string = "cwd"

// __dirname
@val external dirname: string = "__dirname"
// path.join
@module("path") @variadic external pathJoin: array<string> => string = "join"
// process.argv
@scope("process") @val external argv: array<string> = "argv"
// fs.existsSync
@module("fs") external existsSync: string => bool = "existsSync"
// fs.makeDirSync
@module("fs") external mkdirSync: string => unit = "mkdirSync"
// fs.createWriteStream
@module("fs") external createWriteStream: string => unit = "createWriteStream"
// fs.writeFileSync
@module("fs") external writeFile: (string, string) => unit = "writeFileSync"

type execOption = {cwd: string}

// exec
@module("child_process") @val external exec: (string, execOption) => Buffer.t = "execSync"

let directoryName = argv->Belt.Array.get(2)->Belt.Option.getWithDefault("rs_project")
let directoryPath = pathJoin([cwd(), directoryName])

if !existsSync(directoryPath) {
  Js.log("Generating Project Directory...")
  mkdirSync(directoryPath)
  mkdirSync(pathJoin([directoryPath, "src"]))
  createWriteStream(pathJoin([directoryPath, "README.md"]))

  Js.log("Writing default configurations...")
  writeFile(pathJoin([directoryPath, "src", "demo.res"]), Default.demoRes)
  writeFile(pathJoin([directoryPath, "bsconfig.json"]), Default.bscongifJson(directoryName))
  writeFile(pathJoin([directoryPath, "package.json"]), Default.packageJson(directoryName))
  writeFile(pathJoin([directoryPath, ".gitignore"]), Default.gitIgnore)

  Js.log("Installing Dependencies...")
  let _ = exec("npm install --save", {cwd: directoryPath})
  Js.log("Done!")
}
