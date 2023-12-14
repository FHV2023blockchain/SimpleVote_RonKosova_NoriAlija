const svote = artifacts.require("SimpleVote");

module.exports = function(deployer) {
    deployer.deploy(svote);
};

