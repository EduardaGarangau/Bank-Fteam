# Bank Methods

Observações
> A ação de transferência foi removida.  
* Deve ser feito um menu interativo, para o usuário poder escolher as opções.
* Deve ser dado feedback ao usuário em cada ação, se deu certo, mostre o que mudou, se deu errado, exiba porque deu errado
* Em toda operação, a senha deve ser solicitada após a respectiva aplicação da regra
* Faça as validações que forem necessárias.

---
## Sacar
O usuário deve poder sacar o dinheiro.
  * Não é possível realizar valor seja maior que o saldo atual

---
## Empréstimo
Caso a conta seja corrente, deve ser possível realizar um empréstimo
  * Não é possível caso não tenha renda mensal
  * O valor do empréstimo deve ser de no máximo 70% da renda e de no mínimo 20%.
  * O valor emprestado, deve entrar na fatura do cartão.
  * O usuário deve escolher um valor entre a margem especificada anteriormente.

---
## Depósito
O usuário deve poder depositar um valor em sua conta
  * O valor não deve exceder 5000.

---
## Rendimento
Caso a conta seja poupança, o dinheiro pode render.
  * [OBS] Não deve ser alterado o valor, apenas mostrado quanto renderia em X tempo.
  * Deve ser enviado uma quantidade de dias.
  * Baseado nesse tempo, devem ser feitos 3 cálculos.
    * Metade do tempo
    * Tempo alvo
    * Dobro do tempo.
  * O dinheiro rende 2% ao dia.

---
## Pagar com o débito
O usuário deve poder pagar com seu cartão
  * Deve ser recebido um valor.
  * O valor não deve exceder o saldo.

---
## Pagar com o crédito
O usuário deve poder pagar com seu cartão de crédito
  * Deve ser recebido um valor.
  * O valor não deve exceder o limite