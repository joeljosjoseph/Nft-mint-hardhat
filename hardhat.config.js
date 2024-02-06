require("@nomicfoundation/hardhat-toolbox");

const endpointUrl =
  "https://sepolia.infura.io/v3/c2b392f49aef4123a04af40ea30d0819";
const privateKey =
  "fc785b3e2c17e8aa7cde6b6e8d7224cddb87b9c8309472e5f9135bafb14874ec";

module.exports = {
  solidity: "0.8.21",
  networks: {
    sepolia: {
      url: endpointUrl,
      accounts: [privateKey],
    },
    localhost: {
      url: "HTTP://127.0.0.1:7545", // Assuming your Ganache is running on the default port
      accounts: [
        "0xb1f12773a024f1b2c1f3ac3ffc9d039e196001d16626bf4ed16aaf195b3e9e19",
      ], // You may need to specify accounts if your Ganache has pre-funded accounts
    },
  },
};
