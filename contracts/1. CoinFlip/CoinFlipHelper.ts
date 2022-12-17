import { expect } from "chai";
import { ethers } from "hardhat";

const helper = async (victim: any, attacker: any) => {
  // Attack the original contract 10 times in a row.
  for (let i = 0; i < 10; i++) {
    await attacker.hackContract();
  }
};

export default helper;
