const { expect } = require("chai");

describe("Create2", function () {
  it("Should return the address of the smart contract Create2", async function () {
    
    const [deployer, creator] = await ethers.getSigners();
    
    const Create2 = await ethers.getContractFactory("Create2Factory");

    this.create2 = await Create2.deploy();

    let tx = await this.create2.connect(creator).deploy(123);
    let receipt = await tx.wait();

    let event = receipt.events?.filter((x) => {
      return x.event == "Deploy"
    })

    const address_event = event[0].args[0];

    const bytecode = await this.create2.get_bytecode(creator.address);
    const address_calc = await this.create2.get_address(bytecode, 123);
    
    expect(address_calc).to.equal(address_event);
  });
});
