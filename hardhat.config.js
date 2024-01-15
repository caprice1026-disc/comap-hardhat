require("@nomicfoundation/hardhat-toolbox");
require("dotenv").config();

const { POLYGON_MAINNET_URL, PRIVATE_KEY } = process.env;

module.exports = {
  solidity: "0.8.20",
  networks: {
    polygon: {
      url: POLYGON_MAINNET_URL,
      accounts: [`0x${PRIVATE_KEY}`]
    },
    // 他のネットワーク設定...
  },
  // 他の設定...
};