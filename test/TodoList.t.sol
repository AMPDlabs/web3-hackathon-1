// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test, console} from "forge-std/Test.sol";
import {TodoList} from "../src/TodoList.sol";

contract TodoListTest is Test {
    TodoList todoList;

    function setUp() public {
        todoList = new TodoList();
    }

    function testCreateTask() public {
        todoList.createTask("My task");
        TodoList.Task memory task = todoList.getTask(1);

        assertEq(task.id, 1);
        assertEq(task.description, "My task");
        assertEq(task.completed, false);
    }

    function testToggleTaskCompletion() public {
        todoList.createTask("Toggle completion task!");
        todoList.toggleTaskCompletion(1);
        TodoList.Task memory task = todoList.getTask(1);
        assertEq(task.completed, true);
    }

    function testToggleTaskCompletionOutOfBounds() public {
        vm.expectRevert();
        todoList.toggleTaskCompletion(1);
    }

    function testGetTaskCount() public {
        uint256 count = todoList.getTaskCount();
        assertEq(count, 0);
        console.log("Count1: ", count);

        todoList.createTask("Third task");
        count = todoList.getTaskCount();
        console.log("Count2: ", count);
        assertEq(count, 1);
    }
}
