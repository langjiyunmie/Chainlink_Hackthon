// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.28;

import {Script} from "lib/forge-std/src/Script.sol";
import {MEVGuard} from "src/Mev/MEVGuard.sol";
import {SubcriptionConsumer} from "src/SubcriptionConsumer.sol";
import {UniswapV2Factory} from "src/UniswapV2/UniswapV2Factory.sol";

contract Deploy is Script {
    SubcriptionConsumer public consumer;
    UniswapV2Factory public uniswapV2Factory;
    MEVGuard public mevGuard;

    function run() external {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");

        vm.startBroadcast(deployerPrivateKey);

        // 部署 VRF 合约
        consumer = new SubcriptionConsumer(
            84164342277691742430324423338578574746188882049571291576013765335025561414169
        ); // 替换为实际的订阅 ID

        // 部署 MEVGuard 合约
        mevGuard = new MEVGuard(msg.sender, 10, 1000, 5000, address(consumer));

        // 部署 UniswapV2Factory 合约
        uniswapV2Factory = new UniswapV2Factory(
            vm.addr(deployerPrivateKey),
            address(mevGuard)
        );

        vm.stopBroadcast();
    }
}
