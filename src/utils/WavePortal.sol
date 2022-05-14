// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.4;

import "hardhat/console.sol";

contract WavePortal{

  uint256 totalWaves;

  /* 
  * NewWaveというイベントを作成している
  */
  event NewWave(address indexed from, uint256 timestamp, string message);

  /*
  * Waveという構造体を作成
  */
  struct Wave{
    address waver;
    string message;
    uint256 timestamp;
  }

 Wave[] waves;
  constructor(){
    console.log("WavePortal - Smart Contract!");
  }

  function wave(string memory _message) public{
    totalWaves += 1;
    console.log("%s waved w/ message %s", msg.sender, _message);

    waves.push(Wave(msg.sender, _message, block.timestamp));

    emit NewWave(msg.sender, block.timestamp, _message);
  }

  function getAllWaves() public view returns (Wave[] memory){
    return waves;
  }

  function getTotalWaves() public view returns (uint256){
    console.log("We have %d total waves!", totalWaves);
    return totalWaves;
  }
}