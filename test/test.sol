const assert = require('assert');
const ganache = require('ganache-cli');
const Web3 = require('web3');
const provider = ganache.provider();
const web3 = new Web3(provider);
const { abi } = require('../compile');
const input = require('../compile');
//console.log(abi);
const bytecode = input.evm.bytecode.object;

let accounts;
let sample;

beforeEach(async() => {
    accounts = await web3.eth.getAccounts();
    sample = await new web3.eth.Contract(abi)
          .deploy({ data: bytecode, arguments: ['Hi There!'] })
          .send({ from: accounts[0], gas: '1000000' })
    sample.setProvider(provider);
})

describe('Sample', ()=> {
    it('deploys a contract', async () => {
        console.log('accounts: '+ accounts[0]);
    })

    it('displays initial message', async () => {
        console.log(await sample.methods.message().call(), accounts[0]);
    })

    it('sets a new message', async () => {
        await sample.methods.setMessage('Bye!').send({ from: accounts[0] });
        console.log(await sample.methods.message().call(), await sample.options.address);
    })


})
