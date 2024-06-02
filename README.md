# Web3-hackaton-1
Getting started with Solidity and Foundry. _We will complete a TodoList smart contract, deploy it to the Base blockchain on the Sepolia testnet and interact with the smart contract through base scan._

## ⚙️ Prerequisites 
_Before we start there are a few things you need to do._
* Create Coinbase Wallet - https://www.coinbase.com/wallet/articles/getting-started-extension#create-a-new-wallet
* Fund wallet with Sepolia ETH from Faucet - https://www.alchemy.com/faucets/ethereum-sepolia
* Go to https://basescan.org/register and sign up
* Then go and create an API key at: https://basescan.org/myapikey
* Create a file called `.env` and copy the content from `.env.example`
* Copy your key into BASESCAN_API_KEY in the `.env` file.
* Install Foundry`curl -L https://foundry.paradigm.xyz | bash`
* VSCode setup: https://book.getfoundry.sh/config/vscode
* If you are on Windows look into the remappings.txt file and update the paths. 
BASESCAN_API_KEY

## ✨Notes (for Base Sepolia Testnet)
_Setting up deployer_

🚨 You will need the private key from your coinbase wallet (NEVER show this to anyone EVER!).
🔐 When you have your private key run the command below to store your private key in an encrypted state on your local machine.
```
cast wallet import deployer --interactive
```
To get your private key go to your CoinBase Wallet > Settings > Show Private Key. Paste it to the terminal after running the command and then set a password.

### Deploy:
You have to run `source .env` to read the .env values. Then you can deploy by running:
```
forge create ./src/TodoList.sol:TodoList --rpc-url $BASE_SEPOLIA_RPC --account deployer --verify --etherscan-api-key $BASESCAN_API_KEY
```
To checkout your deployed contract go to: https://sepolia.basescan.org/address and search for the contracts address that you got from the terminal when you ran `forge create`.

### Verify deployed contract:
```
forge verify-contract 0x8ab1ed35bf801f4e4a326076dbed122b40747fc9 ./src/CoinFlip.sol:CoinFlip --etherscan-api-key $BASESCAN_API_KEY --chain-id 84532 --watch
```

### Install dependencies
```
# Install Solmate and OpenZeppelin contracts as dependencies
forge install transmissions11/solmate Openzeppelin/openzeppelin-contracts@v5.0.1
```

## Usage

### Build

```shell
forge build
```

### Test

```shell
forge test
```

### Debug
```shell
forge test --debug testCreateTask
```

### Format

```shell
forge fmt
```

### Gas Snapshots

```shell
forge snapshot
```

### Anvil

```shell
anvil
```

### Cast

```shell
cast <subcommand>
```

### Help

```shell
forge --help
anvil --help
cast --help
```
