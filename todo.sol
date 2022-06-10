// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4; //>= version 0.8.4

contract ToDoList {
    struct todo
    {
        string task;
        string descrip;
        uint256 timeofcreation;
        address createdby;
        //bool status;
    } //bytestudy->for fixed len strings
    
    //mapping (address => todo[]) private users;
    /*
    mappping -> hashtable 
    address -> key for hashmap (account address )
    */
   
    todo [] arr;
    function createnewtask(string calldata _task,  string calldata _descrip) external 
    //makes the method available when called through web3js.
    {

        todo memory obj;
        obj.task = _task;
        obj.descrip = _descrip;
        obj.timeofcreation = block.timestamp;
        obj.createdby = msg.sender; 
        arr.push(obj);
        //mood = _mood;
    }
    
    //create task
    /*function createtask(uint _taskind) external view returns (todo memory)
    {
        todo storage task = users[msg.sender][_taskind];
        return task;
    }*/

    function updatetask(uint256 taskind, string calldata _desc, string calldata name) external  
    {
        if(keccak256(abi.encodePacked(name)) != "")
           arr[taskind].task = name;
        if(keccak256(abi.encodePacked(_desc)) != "")
           arr[taskind].descrip = _desc;
        //return mood;
    }
    
    function deletetast(uint256 taskind) external
    {
        delete arr[taskind];
    }
}
