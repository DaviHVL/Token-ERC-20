# Criando a sua Primeira Criptomoeda na Rede Ethereum

Este projeto consiste na criação de um token no padrão **ERC-20** na rede **Ethereum**, utilizando as tecnologias **Solidity**, **Truffle**, **Ganache**, **Remix IDE** e **Metamask**. A implementação aborda desde a criação do token até a sua publicação na blockchain, além da realização de transações entre contas.

## Objetivos

- **Criar um token ERC-20** compatível com a rede Ethereum.
- **Publicar o token na blockchain** Ethereum para ser utilizado em transações.
- **Realizar transações** entre diferentes contas de usuários, utilizando carteiras digitais.

## Tecnologias Utilizadas

- **Solidity**: Linguagem de programação usada para escrever contratos inteligentes na Ethereum.
- **Truffle**: Um ambiente de desenvolvimento e framework para contratos inteligentes.
- **Ganache**: Um simulador de blockchain local para desenvolvimento e testes.
- **Remix IDE**: Um ambiente de desenvolvimento online para escrever, compilar e testar contratos inteligentes.
- **Metamask**: Uma extensão de navegador para interagir com a blockchain Ethereum e gerenciar carteiras de criptomoedas.

## Etapas do Projeto

### 1. Implementação do Token ERC-20
Nesta etapa, você criará o contrato inteligente que define seu token. O token segue o padrão ERC-20, garantindo compatibilidade com outras ferramentas e contratos da rede Ethereum.

O contrato inclui as seguintes funcionalidades:
- **totalSupply**: Definir a quantidade total de tokens.
- **balanceOf**: Retornar o saldo de tokens de uma conta.
- **transfer**: Transferir tokens entre contas.
- **approve**: Autorizar terceiros a gastar tokens em nome de uma conta.
- **transferFrom**: Transferir tokens entre contas usando uma permissão pré-aprovada.

### 2. Publicação na Blockchain
Uma vez que o contrato inteligente estiver implementado e testado, ele será publicado na blockchain Ethereum.

Passos para a publicação:
- Use o **Remix IDE** ou o **Truffle** para compilar e fazer o deploy do contrato na rede Ethereum (pode ser em uma rede de testes ou na rede principal).
- Conecte sua carteira **Metamask** à rede correta e financie-a com tokens de teste (caso utilize uma rede de testes).

### 3. Realização de Transações
Depois que o token estiver publicado na blockchain, você poderá realizar transações:
- **Enviar e receber tokens** entre contas.
- **Aprovar e transferir tokens** de uma conta por um terceiro autorizado.

Essas transações podem ser realizadas diretamente no **Metamask**, usando as funções disponíveis no contrato inteligente ou via scripts automatizados com **Truffle**.
