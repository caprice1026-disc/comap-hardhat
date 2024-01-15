// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Permit.sol";

contract Comap is ERC20, Ownable, ERC20Permit {
        // 承認を許可されたアドレスのマッピング
    mapping(address => bool) private _allowedApproveAddresses;

    constructor(address initialOwner)
        ERC20("Comap", "Comap")
        Ownable(initialOwner)
        ERC20Permit("Comap")
    {}

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

        // `approve`関数を使用するためにアドレスを許可する関数
    function allowAddressForApprove(address _address) public onlyOwner {
        _allowedApproveAddresses[_address] = true;
    }

    // アドレスの`approve`関数の使用を不許可にする関数
    function disallowAddressForApprove(address _address) public onlyOwner {
        _allowedApproveAddresses[_address] = false;
    }

    // `approve`関数をオーバーライドして使用を制限
    function approve(address spender, uint256 amount) public override(ERC20) returns (bool) {
        require(_allowedApproveAddresses[msg.sender], "Sender not authorized to approve");
        return super.approve(spender, amount);
    }
}
