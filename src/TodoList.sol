// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract TodoList {
    uint256 public taskCount = 0;

    struct Task {
        uint256 id;
        string description;
        bool completed;
    }

    mapping(uint256 => Task) public tasks;

    constructor() {}

    function createTask(string memory _description) public returns (Task memory) {
        taskCount++;
        tasks[taskCount] = Task(taskCount, _description, false);
        return tasks[taskCount];
    }

    function toggleTaskCompletion(uint256 _id) public returns (Task memory) {
        // TODO toggle the complete property of the task with id _id
        return tasks[_id];
    }

    function getTask(uint256 _id) public view returns (Task memory) {
        // TODO return task with id equal to _id
    }

    function getTaskCount() public view returns (uint256) {
        // TODO return the total number of tasks
        return 0;
    }
}
