import { Contract } from "@ethersproject/contracts";
import { ethers } from "hardhat";

import { TokenClaim__factory } from "../typechain";

async function main(): Promise<void> {
  const Claim: TokenClaim__factory = await ethers.getContractFactory("TokenClaim");
  const claim: Contract = await Claim.deploy(
    "0xE7C79a9e5Dd67f237323523f573a3359542fa7C4", // HZN address
    "0xF09f5E21F86692C614D2D7B47E3b9729DC1C436F", // PHB address
    "0x64aC4907B29aA25f4Df91356fAC4772F16A4803e", // Spender address
    "0x64aC4907B29aA25f4Df91356fAC4772F16A4803e",
  );
  await claim.deployed();

  console.log("Claim deployed to: ", claim.address);
}

// We recommend this pattern to be able to use async/await everywhere and properly handle errors.
main()
  .then(() => process.exit(0))
  .catch((error: Error) => {
    console.error(error);
    process.exit(1);
  });
