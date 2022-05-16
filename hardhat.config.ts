import * as dotenv from "dotenv";

import { extendEnvironment, HardhatUserConfig, task } from "hardhat/config";
import "@nomiclabs/hardhat-etherscan";
import "@nomiclabs/hardhat-waffle";
import "@typechain/hardhat";
import "hardhat-gas-reporter";
import "solidity-coverage";
import "hardhat-log-remover";
import {
  privateKeyAlice, privateKeyTom,
  privateKeyDowner, privateKeyAye
} from './config/secret.json';

dotenv.config();

// This is a sample Hardhat task. To learn how to create your own go to
// https://hardhat.org/guides/create-task.html
task("accounts", "Prints the list of accounts", async (taskArgs, hre) => {
  const accounts = await hre.ethers.getSigners();

  for (const account of accounts) {
    console.log(account.address);
  }
});

// 扩展环境
extendEnvironment((hre: any) => {
  const Web3: any = require("web3");
  hre.Web3 = Web3;
  // 注意大小写
  hre.web3 = new Web3(hre.network.provider);
});

// You need to export an object to set up your config
// Go to https://hardhat.org/config/ to learn more

const config: HardhatUserConfig = {
  solidity: "0.8.13",
  networks: {
    ropsten: {
      url: process.env.ROPSTEN_URL || "",
      accounts:
        process.env.PRIVATE_KEY !== undefined ? [process.env.PRIVATE_KEY] : []
    },
    ganache: {
      url: "http://127.0.0.1:8545"
    },
    // moonbase: {
    //   url: 'https://rpc.api.moonbase.moonbeam.network',
    //   chainId: 1287,
    //   accounts:[privateKeyAlice, privateKeyTom, privateKeyDowner, privateKeyAye],
    // }
  },
  gasReporter: {
    enabled: process.env.REPORT_GAS !== undefined,
    currency: "USD"
  },
  etherscan: {
    apiKey: process.env.ETHERSCAN_API_KEY
  }
};

export default config;
