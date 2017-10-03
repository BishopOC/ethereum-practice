pragma solidity ^0.4.4;

contract ProofOfExistence1 {
  //state
  bytes32[] public proofs;

  //store a proof of existence in the contract state
  //*transactional function*
  function storeProof(bytes32 proof) public {
    proofs.push(proof);
  }

  //calculate proof of document
  //*transactional function*
  function notarize(string document) public {
    var proof = calculateProof(document);
    storeProof(proof);
  }

  //helper function to get document's sha256
  //*read-only function*
  function calculateProof(string document) public constant returns (bytes32) {
    return sha256(document);
  }

  //check if a document has been notarized
  //*read only function*
  function checkDocument(string document) public constant returns (bool) {
    var proof = calculateProof(document);
    return hasProof(proof);
  }

  function hasProof(bytes32 proof) public constant returns (bool) {
    for(uint i = 0; i < proofs.length; i++) {
      if(proofs[i] == proof) {
        return true;
      }
    }
    return false;
  }
}
