#!/usr/bin/env node

let str = process.argv.splice(2)
if (str.length === 0) {
  str = require('fs').readFileSync('/dev/stdin', 'utf-8')
}

console.log(decodeURIComponent(arg))

