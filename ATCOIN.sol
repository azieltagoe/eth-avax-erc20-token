// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

contract ATCOIN {

    string public name = "ATCOIN";
    string public symbol = "ATC";
    uint8 public decimals = 0;

    event Transfer(address indexed _from, address indexed _to, uint256 _value);
    event Approval(address indexed _owner, address indexed _spender, uint256 _value);


    uint public totalSupply = 0;
    uint public constant maxTotalSupply = 100000;

    mapping (address => uint) balances;

    mapping (address => mapping(address => uint)) allowances;

    
    function balanceOf(address tokenHolder) public view returns (uint256 balance) {
        return balances[tokenHolder];
    }

    function transfer(address _to, uint256 _value) public returns (bool success) {
        require(balances[msg.sender] - _value >= 0, "you don't have enough funds");
        balances[msg.sender] -= _value;
        balances[_to] += _value;
        emit Transfer(msg.sender, _to, _value);
        return true;
    }


    function approve(address _spender, uint256 _value) public returns (bool success) {
        allowances[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);
        return true;
    }


    function allowance(address _owner, address _spender) public view returns (uint256 remaining) {
        return allowances[_owner][_spender];
    }

    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
        require(allowances[_from][msg.sender] >= _value, "you haven't been approved to spend this amount");
        require(balances[_from] - _value >= 0, "the tokenholder doesn't have enough funds");
        allowances[_from][msg.sender] -= _value;
        balances[_from] -= _value;
        balances[_to] += _value;
        emit Transfer(_from, _to, _value);
        return true;
    }

}

contract mintable is ATCOIN {

    function mint(address reciepient, uint value) public returns (bool) {
        require(totalSupply + value <= maxTotalSupply, "The total number of tokens have already been minted");
        balances[reciepient] += value;
        totalSupply += value;
        emit Transfer(address(0), reciepient, value);
        return true;
    }
}
