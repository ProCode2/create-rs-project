// Generated by ReScript, PLEASE EDIT WITH CARE
"use strict";

var Fs = require("fs");
var Path = require("path");
var Belt_Array = require("bs-platform/lib/js/belt_Array.js");
var Belt_Option = require("bs-platform/lib/js/belt_Option.js");
var Child_process = require("child_process");
var Default$CreateRsProject = require("./default.bs.js");

var directoryName = Belt_Option.getWithDefault(
  Belt_Array.get(process.argv, 2),
  "rs_project"
);

var directoryPath = Path.join(process.cwd(), directoryName);

if (!Fs.existsSync(directoryPath)) {
  console.log("Generating Project Directory...");
  Fs.mkdirSync(process.cwd() + "/heya");
  Fs.mkdirSync(process.cwd() + "/heya/src");
  Fs.createWriteStream(process.cwd() + "/heya/README.md");
  console.log("Writing default configurations...");
  Fs.writeFileSync(
    process.cwd() + "/heya/src/demo.res",
    Default$CreateRsProject.demoRes
  );
  Fs.writeFileSync(
    process.cwd() + "/heya/bsconfig.json",
    Default$CreateRsProject.bscongifJson
  );
  Fs.writeFileSync(
    process.cwd() + "/heya/package.json",
    Default$CreateRsProject.packageJson
  );
  Fs.writeFileSync(
    process.cwd() + "/heya/.gitignore",
    Default$CreateRsProject.gitIgnore
  );
  console.log("Installing Dependencies...");
  Child_process.execSync("npm install", {
    cwd: process.cwd() + "/heya",
  });
  console.log("Done!");
}

exports.directoryName = directoryName;
exports.directoryPath = directoryPath;
/* directoryName Not a pure module */