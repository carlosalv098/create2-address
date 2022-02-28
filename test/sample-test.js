const { expect } = require("chai");

describe("Create2", function () {
  it("Should return the address of the smart contract Create2", async function () {
    
    const [deployer, creator] = await ethers.getSigners();
    
    const Create2 = await ethers.getContractFactory("Create2Factory");

    this.create2 = await Create2.deploy();

    // filter = {
    //   address: this.create2.address,
    //   topics: [ethers.utils.id("Deploy(address)")]
    // }

    let tx = await this.create2.deploy(creator.address);
    let receipt = await tx.wait();

    let event = receipt.events?.filter((x) => {
      return x.event == "Deploy"
    })

    console.log(event[0].data)

    // ethers.provider.on(filter, (log, event) => {
    //   console.log(log)
    // })
  });
});
