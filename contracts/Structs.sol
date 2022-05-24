//SPDX-License-Identifier: MIT

pragma solidity ^0.8.14;

contract Structs {
    struct Car {
        string model;
        uint256 year;
        address owner;
    }

    Car public car;
    Car[] public cars;
    mapping(address => Car[]) public carsByOwner;

    function examples() external {
        Car memory toyota = Car("Toyota", 1990, msg.sender);
        Car memory lambo = Car({
            model: "Lamborghini",
            owner: msg.sender,
            year: 1980
        });

        Car memory tesla;
        tesla.model = "Tesla";
        tesla.year = 2010;
        tesla.owner = msg.sender;

        cars.push(toyota);
        cars.push(lambo);
        cars.push(tesla);
        cars.push(Car("Ferrari", 2020, msg.sender));

        Car memory carOne = cars[0];
        Car memory carTwo;
        carTwo.model = "Haval";
        carTwo.year = 2011;
        carTwo.owner = msg.sender;
        delete carTwo.owner;

        delete cars[2];
    }
}
