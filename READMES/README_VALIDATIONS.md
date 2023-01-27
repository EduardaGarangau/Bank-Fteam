# Bank Validations

As validações devem ser feitas com Regex e validadas em testes de unidade

Links úteis

- [Site de Regex 1](https://regexr.com)
- [Site de Regex 2](https://www.debuggex.com)
- [Semana do Teste de unidade](https://www.youtube.com/watch?v=zlYQe-9QMug&list=PLlBnICoI-g-etEtbvgDnO40SYKOSktCj4&ab_channel=Flutterando)
- [Aulão de Teste de unidade](https://www.youtube.com/watch?v=BLHPRg8ickY&t=1s&ab_channel=Flutterando)

---
## Nome Completo

Válidos:
  - Ana Whatever

Inválidos:
  - An
  - Ana
  - Ana Whatever 2

---
## Email

Válidos:
  - whatever@outlook.com.br
  - what_ever@outlook.com
  - whatever@gmail.com
  - what.ever@gmail.com.br
  - what.ever@hotmail.com
  - whatever@hotmail.com.br
  - Whatever@hotmail.com.br
  - w23hatever@hotmail.com.br

Inválidos:
  - whatever@gov.uk
  - 1whatever@outlook.com
  - whatever$#@!@gmail.com
  - whatever@outlook2com1br

---
## Senha

Válidos:
  - 01234567  

Inválidos:
  - 1234567
  - 123456789
  - as#%as12

---
## Telefone

Válidos:
  - 12123451234
  - 12 123451234
  - 12 12345-1234
  - (12) 12345-1234

Inválidos:
  - 123451234
  - 12341234
  - 1212341234

---
## CPF
Válidos:
  - 049.427.230-94
  - 358.760.060-09
  - 595.956.630-34

Inválidos:
  - 042.427.230-94
  - 358.768.060-09
  - 595.956.930-34

Regra:  
Dígitos comuns = 049.427.230  
Dígitos validadores = 94

  - Regra 1: Validação do décimo digito
    - Passo 1:  
      Somar o resultado da multiplicação dos números comuns pela ordem decrescente de 10 a 2;

      Ex: `1*10 + 2*9 + 3*8 + 4*7 + ...9\*2`

    - Passo 2:  
      Multiplicar o resultado do passo 1, multiplicar por 10 e posteriormente dividir por 11.  
      Obs 1: Extraindo o resto não o resultado.  
      Obs 2: Caso o resto seja igual a 10 este deverá ser considerado como 0.

    - Passo 3:  
      O décimo digito será válido caso o resultado do passo 2 seja igual ao décimo digito.

  - Regra 2: Validação do décimo primeiro digito
    - Passo 1:
      Somar o resultado da multiplicação dos 10 primeiros dígito pela ordem decrescente de 11 a 2;  
      OBS.: Deve-se considerar os 9 dígitos comuns mais o primeiro digito já validado, interando um total de 10 algarismos para o calculo.

      Ex: `1*11 + 2*10 + 3*9 + 4*8 + ...1\*2`

    - Passo 2:
      Multiplicar o resultado do passo 1, multiplicar por 10 e posteriormente dividir por 11.  
      Obs 1: Extraindo o resto não o resultado.  
      Obs 2: Caso o resto seja igual a 10 este deverá ser considerado como 0.  

    Passo 3:  
      O décimo primeiro digito será válido caso o resultado do passo 2 seja igual ao décimo primeiro digito.

---
## Renda Mensal
Válidos:
- 0.01
- null

Inválidos:
- -0.01

---
## Data de Validade do cartão
Válidos:
- `Maior que a data atual`

Inválidos:
- `Menor igual a data atual`
