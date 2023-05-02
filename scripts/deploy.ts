import { ethers } from "hardhat";
import {CodingShowToken__factory} from "../typechain-types"

async function main() {
  const [owner] = await ethers.getSigners();

  const factory = new CodingShowToken__factory(owner)

  const contract = await factory.deploy(10, 35)

  await contract.deployed()

  const contractAddress = contract.address;

  console.log(`Mi nuevo contracto es: ${contractAddress}`);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
