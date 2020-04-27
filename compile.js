const path = require('path');
const fs = require('fs');
const solc = require('solc');
const samplePath = path.resolve(__dirname, "contracts", "sample.sol");
const source = fs.readFileSync(samplePath, "utf8");

var input = {
  language: 'Solidity',
  sources: {
    'Sample.sol':{
      content: source
    }
  },
  settings: { // This is the one that i had missed
        outputSelection: {
            '*': {
                '*': [ '*' ]
            }
        }
    }
}


var output = JSON.parse(solc.compile(JSON.stringify(input)));
//console.log(output.contracts['Sample.sol']['Sample']); // #
//module.exports = output.contracts['Sample.sol'];
var x = output.contracts['Sample.sol']['Sample'];

//console.log(x.evm.bytecode.object)
// const {abi} = x;
// console.log(abi)




module.exports = x;
