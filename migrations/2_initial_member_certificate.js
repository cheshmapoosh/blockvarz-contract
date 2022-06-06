const MemberCertificate = artifacts.require("MemberCertificate");

module.exports = function (deployer) {
  deployer.deploy(MemberCertificate);
};
