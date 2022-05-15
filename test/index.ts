import { expect } from "chai";
import { ethers } from "hardhat";
import { SignerWithAddress } from "@nomiclabs/hardhat-ethers/signers";
import { Contract, ContractFactory, Signer } from "ethers";

describe("Greeter", function() {
  it("Should return the new greeting once it's changed", async function() {
    const Greeter = await ethers.getContractFactory("Greeter");
    const greeter = await Greeter.deploy("Hello, world!");
    await greeter.deployed();

    expect(await greeter.greet()).to.equal("Hello, world!");

    const setGreetingTx = await greeter.setGreeting("Hola, mundo!");

    // wait until the transaction is mined
    await setGreetingTx.wait();

    expect(await greeter.greet()).to.equal("Hola, mundo!");
  });
});

describe("MyToken", () => {
  let Token: ContractFactory;
  let token: Contract;
  let owner: SignerWithAddress;
  let addr1: Signer;
  let addr2: Signer;

  beforeEach("Test deployment", async () => {
    Token = await ethers.getContractFactory("Token");
    token = await Token.deploy();
    [owner, addr1, addr2] = await ethers.getSigners();
  });

  it("should all correct", async () => {
    expect(await token.owner()).to.equal(owner.address);
  });

  it("should deploy own all tokens", async () => {
    const totalSupply = await token.totalSupply();
    expect(totalSupply).equal(1000000);
    expect(await token.balanceOf(owner.address)).to.equal(totalSupply);
  });


  it("send token address 1 correctly",  async function() {
    await token.transfer(addr1.getAddress(), 100);
    let  balanceOfAddress1 = await token.balanceOf(addr1.getAddress());
    expect(balanceOfAddress1).to.equal(99);

    await token.connect(addr1).transfer(addr2.getAddress(), 50);
    balanceOfAddress1 = await token.balanceOf(addr1.getAddress());
    expect(balanceOfAddress1).to.equal(49);
  });


  // it("send token address 2 correctly",  async function() {
  //   await token.transfer(addr2.getAddress(), 40);
  //   const balanceOfAddress2 = await token.balanceOf(addr2.getAddress());
  //   expect(balanceOfAddress2).to.equal(40);
  // });

});
