// SPDX-License-Identifier: GPL-3.0-only
pragma solidity ^0.8.13;

interface IUniswapV2Factory {
    event PairCreated(address indexed token0, address indexed token1, address pair, uint256 allPairsLength);

    function feeToSetter() external view returns (address);

    function setFeeToSetter(address) external;

    function swapFeeRate() external view returns (uint256);

    function pairImplementation() external view returns (address);

    function feeTo() external view returns (address);

    function allPairs(uint256) external view returns (address pair);

    function MEVGuard() external view returns (address);

    function allPairsLength() external view returns (uint256);

    function getPair(address tokenA, address tokenB) external view returns (address pair);

    function createPair(address tokenA, address tokenB) external returns (address pair);

    function setFeeTo(address feeTo) external;

    function setMEVGuard(address MEVGuard) external;

    error ZeroAddress();

    error PairExists();

    error IdenticalAddresses();
}
