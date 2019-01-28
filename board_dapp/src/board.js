import web3 from './web3';

const address = '';

const abi = [
  {
    "inputs": [],
    "payable": false,
    "stateMutability": "nonpayable",
    "type": "constructor"
  },
  {
    "anonymous": false,
    "inputs": [
      {
        "indexed": false,
        "name": "chair",
        "type": "address"
      }
    ],
    "name": "BoardCreated",
    "type": "event"
  },
  {
    "anonymous": false,
    "inputs": [
      {
        "indexed": false,
        "name": "member",
        "type": "address"
      }
    ],
    "name": "NewBoardMember",
    "type": "event"
  },
  {
    "constant": false,
    "inputs": [],
    "name": "kill",
    "outputs": [],
    "payable": false,
    "stateMutability": "nonpayable",
    "type": "function"
  }
];
export default new web3.eth.Contract(abi, address);
