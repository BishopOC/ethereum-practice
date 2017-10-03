pragma solidity ^0.4.4;

contract ProofOfExistence1 {
  //state
  bytes32 public proof;

  //calculate proof of document
  //*transactional function*
  function notarize(string document) public {
    proof = calculateProof(document);
  }
  //helper function to get document's sha256
  //*read-only function*
  function calculateProof(string document) public constant returns (bytes32) {
    return sha256(document);
  }
}
