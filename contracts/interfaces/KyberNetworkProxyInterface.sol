pragma solidity ^0.5.0;

import "./ERC20.sol";


contract KyberNetworkProxyInterface {
    function maxGasPrice() external view returns (uint256);

    function getUserCapInWei(address user) external view returns (uint256);

    function getUserCapInTokenWei(address user, ERC20 token) external view returns (uint256);

    function enabled() external view returns (bool);

    function info(bytes32 id) external view returns (uint256);

    function getExpectedRate(ERC20 src, ERC20 dest, uint256 srcQty)
        public
        view
        returns (uint256 expectedRate, uint256 slippageRate);

    function tradeWithHint(
        ERC20 src,
        uint256 srcAmount,
        ERC20 dest,
        address destAddress,
        uint256 maxDestAmount,
        uint256 minConversionRate,
        address walletId,
        bytes memory hint
    ) public payable returns (uint256);

    function trade(
        ERC20 src,
        uint256 srcAmount,
        ERC20 dest,
        address destAddress,
        uint256 maxDestAmount,
        uint256 minConversionRate,
        address walletId
    ) public payable returns (uint256);

    function swapEtherToToken(ERC20 token, uint256 minConversionRate)
        external
        payable
        returns (uint256);

    function swapTokenToEther(ERC20 token, uint256 tokenQty, uint256 minRate)
        external
        payable
        returns (uint256);

    function swapTokenToToken(ERC20 src, uint256 srcAmount, ERC20 dest, uint256 minConversionRate)
        public
        returns (uint256);
}
