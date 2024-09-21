// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

interface IERC20{
    //Getters
    //Retorna o número total de tokens em circulação.
    function totalSupply() external view returns(uint256);

    //Retorna o saldo de tokens de uma determinada conta.
    function balanceOf(address account) external view returns(uint256);

    //Retorna a quantidade de tokens que um spender (gastador) está autorizado a gastar em nome do owner.
    function allowance(address owner, address spender) external view returns(uint256);

    //Functions
    //Transfere uma quantidade especificada de tokens para um destinatário (recipient).
    function transfer(address recipient, uint256 amount) external returns (bool);

    //Permite que uma terceira parte (spender) gaste uma quantidade específica de tokens do chamador da função.
    function approve(address spender, uint256 amount) external returns (bool);

    //Transfere tokens de uma conta (sender) para outra (recipient) usando uma permissão previamente aprovada.
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);

    //Events
    //Emite um evento sempre que ocorre uma transferência de tokens.
    event Transfer(address indexed from, address indexed to, uint256 value);

    //Emite um evento sempre que um spender é autorizado a gastar tokens em nome de um owner.
    event Approval(address indexed owner, address indexed spender, uint256);
}

contract DaviCoin is IERC20{
    //Variáveis Constantes
    string public constant name = "DaviCoin";
    string public constant symbol = "DAC";
    uint8 public constant decimals = 18;

    //Variáveis de Estado
    mapping (address => uint256) balances;
    mapping(address => mapping(address=>uint256)) allowed; //Mapping em que a chave é o endereço e está ligado a um conjunto de endereços autorizados a gastar uma quantia X.
    uint256 totalSupply_ = 10 ether;

    //Construtor
    constructor(){
        balances[msg.sender] = totalSupply_;
    }

    //Implementação das funções da Interface ERC-20
    //Getters
    function totalSupply() public override view returns (uint256) {
        return totalSupply_;
    }

    function balanceOf(address tokenOwner) public override view returns (uint256){
        return balances[tokenOwner];
    }

    function allowance(address owner, address delegate) public override view returns (uint256) {
        return allowed[owner][delegate];
    }

    //Functions
    function transfer(address receiver, uint256 numTokens) public override returns (bool) {
        require(numTokens <= balances[msg.sender]);
        balances[msg.sender] = balances[msg.sender]-numTokens;
        balances[receiver] = balances[receiver]+numTokens;
        emit Transfer(msg.sender, receiver, numTokens);
        return true;
    }

    function approve(address delegate, uint256 numTokens) public override returns (bool) {
        allowed[msg.sender][delegate] = numTokens;
        emit Approval(msg.sender, delegate, numTokens);
        return true;
    }

    function transferFrom(address owner, address buyer, uint256 numTokens) public override returns (bool) {
        require(numTokens <= balances[owner]);
        require(numTokens <= allowed[owner][msg.sender]);

        balances[owner] = balances[owner]-numTokens;
        allowed[owner][msg.sender] = allowed[owner][msg.sender]-numTokens;
        balances[buyer] = balances[buyer]+numTokens;
        emit Transfer(owner, buyer, numTokens);
        return true;
    }
}