// SPDX-License-Identifier: MIT

pragma solidity >=0.4.22 <0.9.0;


contract Election{

    //Model a candidate
    struct Candidate{
        uint id;
        string name;
        uint voteCount;
    }

    //Store accoutns that have voted
    mapping(address => bool) public voters;
    
    //Store Candidates
    //Fetch Candidate
    mapping(uint => Candidate) public candidates;

    //store candidates count
    uint public candidatesCount;

    event votedEvent(string mine,uint indexed _candidateId);

    event WinnerEvent(string result,uint indexed _candidateId);

    constructor() public{
        addCandidate("NarendraModi");
        addCandidate("Manmohan Singh");
    }

    function addCandidate(string memory _name) private{
        ++candidatesCount;
        candidates[candidatesCount] = Candidate(candidatesCount, _name,0);
    }

    function vote(uint _candidateId) public{
        //require that they have vated before
        require(!voters[msg.sender]);

        //require a valid candidate
        require(_candidateId > 0 && _candidateId <= candidatesCount);

        //record that voter has voted
        voters[msg.sender] = true;

        //update candidate vote count
        candidates[_candidateId].voteCount++;

        //trigger voted event
        emit votedEvent("voted right now", _candidateId);
    }

    function winner () public view returns(string memory winnerNameString) {
for(uint i =0; i <= candidatesCount; i++ ){
if(candidates[i].voteCount >= 3){
// return string.concat("this person is the winner ", candidates[i].name);
return candidates[i].name;
}
}
}

    
}    