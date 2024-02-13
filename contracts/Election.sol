pragma solidity ^0.8.19;
contract Election {
   string public candidate;
   //model a candidate
   struct Candidate {
    uint id;
    string name;
    uint voteCount;
   }
   mapping(address => bool) public voters;
   //fetch candidate
   mapping(uint => Candidate) public candidates;
   uint public candidatesCount;

    event votedEvent (
        uint indexed _candidateId
    );
   
   //costructor

   constructor() {
    addCandidate("CANDIDATE 1");
    addCandidate("CANDIDATE 2");
   }

    function addCandidate (string memory _name) private {
        candidatesCount ++;
        candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);
    }

    function vote (uint _candidateId) public {
        // require that they haven't voted before
        require(!voters[msg.sender]);
        require(_candidateId > 0 && _candidateId <= candidatesCount);

        voters[msg.sender] = true;

        candidates[_candidateId].voteCount ++;
        
        emit votedEvent(_candidateId);
        

    }
}
