import chai from "chai";
import chaiAsPromised from "chai-as-promised";
import chaiBignumber from "chai-bignumber";

const GetNumber = artifacts.require("./test/GetNumber.sol");

before(async () => {
  const getNumber = await GetNumber.new();
  const number = await getNumber.number.call();
  const BigNumber = number.constructor;
  chai.use(chaiAsPromised).use(chaiBignumber(BigNumber));
  global.BigNumber = BigNumber;
});
