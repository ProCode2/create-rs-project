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
  mkdirSync(cwd() ++ "/heya")
  mkdirSync(cwd() ++ "/heya/src")
  createWriteStream(cwd() ++ "/heya/README.md")

  Js.log("Writing default configurations...")
  writeFile(cwd() ++ "/heya/src/demo.res", Default.demoRes)
  writeFile(cwd() ++ "/heya/bsconfig.json", Default.bscongifJson)
  writeFile(cwd() ++ "/heya/package.json", Default.packageJson)
  writeFile(cwd() ++ "/heya/.gitignore", Default.gitIgnore)

  Js.log("Installing Dependencies...")
  let _ = exec("npm install", {cwd: cwd() ++ "/heya"})
  Js.log("Done!")
}
