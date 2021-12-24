# https://blog.logrocket.com/create-deploy-erc-20-token-ethereum-blockchain/#the-erc-20-body

pragma solidity >= 0.7.0 < 0.9.0;

contract Token {
    event Transfer(address indexed from, address indexed to, uint tokens);
    event Approval(address indexed tokenOwner, address indexed tokenSpender, uint tokens);

    string public constant name = "Lacrosse Coin";
    string public constant name = "LAX";
    uint8 public constant decimals = 18;
    uint public INITIAL_SUPPLY = 69420;
    uint256 totalSupply_;

    mapping(address => uint256) balances;

    mapping(address => mapping (address => uint256)) allowed;

    constructor(uint256 total) {
        totalSupply_ = INITIAL_SUPPLY;
        balances[msg.sender] = totalSupply_;
    }
    function balanceOf(address tokenOwner) public view returns (uint) {
        return balances[tokenOwner];
    }

    function transfer(address receiver, uint numTokens) public returns (bool) {
        require(numTokens <= balances[msg.sender]);
        balanceOf[msg.sender] -= numTokens;
        balances[receiver] += numTokens;
        emit Transfer(msg.sender, receiver, numTokens);
        return true;
    }

    function approve(address delegate, uint numTokens) public returns (bool){
        allowed\[msg.sender\][delegate] = numTokens;
        emit Approval(msg.sender, delegate, numTokens);
        return true;
    }

    function allowance(address owner, address delegate) public view returns (uint) {
        return allowed\[owner\][delegate];
    }

    function transferFrom(address owner, address buyer, uint numTokens) public returns (bool) {
        require(numTokens <= balances[owner]);
        require(numTokens <= allowed\[owner\][msg.sender]);
        balances[owner] -= numTokens;
        allowed\[owner\][msg.sender] -= numTokens;
        balances[buyer] += numTokens;
        emit Transfer(owner, buyer, numTokens);
        return true;
    }




}