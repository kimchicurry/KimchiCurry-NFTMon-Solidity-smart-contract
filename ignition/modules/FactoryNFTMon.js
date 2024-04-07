const { buildModule } = require("@nomicfoundation/hardhat-ignition/modules");

const JAN_1ST_2030 = 1893456000;
const ONE_GWEI = 1_000_000_000n;

module.exports = buildModule("NFTFactory", (m) => {

  //constructor args
  const lock = m.contract("NFTFactory", [], {
  });

  console.log(lock.address);
  console.log(lock.target);
  return { lock };
});
