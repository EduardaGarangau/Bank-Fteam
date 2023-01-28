# Bank Input

O Usuário deve inserir suas informações para criar sua conta.  
Caso alguma validação falhe. Deve ter exibido o problema.  

Links úteis
  * [Uso do terminal](https://dart.dev/tutorials/server/cmdline#reading-and-writing-with-stdin-stdout-and-stderr)

---
## Passo 1 
Deve ser inserido na seguinte ordem:
  * Nome
  * Email
  * Telefone
  * CPF
  * Senha
  * Endereço
    * CEP
    * Rua
    * Bairro
    * Cidade
    * Estado 
    * Número
    * Complemento
  * Renda mensal

---
## Passo 2
Após essas informações, ele deve escolher se deseja uma conta corrente ou poupança

Independente da conta, 
  * A agência deve ser auto gerada
  * O Banco deve ter um código de 3 dígitos a sua escolha
  * O número da conta deve ser auto gerado
  * O saldo iniciado zerado

---
### Passo 2.1
Caso seja tenha escolhido poupança  
  * O cartão só poderá ser de débito.

---
### Passo 2.2
Caso seja tenha escolhido corrente
  * Ao escolher o tipo do cartão
    * Caso ele tenha enviado uma renda mensal, deve ter a opção de crédito.
    * Caso não tenha, o cartão só poderá ser de débito.

---
## Passo 3
Ao selecionar o cartão, ele deverá ser criado com as seguintes regras
  * A Bandeira deve ser um nome a sua escolha
  * O Número deve ser auto gerado
  * A Validade deve ser de 10 anos
  * O cvv deve ser auto gerado
  * O nome do dono deve ser o mesmo informado na hora da criação da conta

Caso seja de crédito
  * O valor gasto deve começar zerado
  * O limite deve seguir a seguinte regra
    * Renda mensal menor de 1000. Limite de 10%.
    * Renda mensal menor de 2500. Limite de 25%.
    * Renda mensal menor de 5000. Limite de 40%.
    * Renda mensal menor de 10000. Limite de 60%.
    * Acima disso. Limite de 75%.
