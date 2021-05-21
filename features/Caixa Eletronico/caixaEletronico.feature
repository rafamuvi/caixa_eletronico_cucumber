Feature: Saque Caixa Eletronico

    Como correntista do banco quero ser capaz de sacar dinheiro, utilizando ou não
    do limite de cheque especial e solicitar comprovante de saque

    Scenario Outline: Sistema deve imprimir comprovante se cliente desejar
        Given cliente está no sistema do caixa eletrônico
        And é "<horario>" horas de um(a) "<dia_semana>"
        And o dia em questão é "<tipo_dia>"
        When cliente tenta sacar R$"<valor_saque>"
        And saldo disponível é de R$"<valor_saldo>"
        And limite de cheque especial é R$"<limite_especial>"
        And cliente "<solicita_comprovante>" comprovante
        Then sistema "<sistema_imprime>" comprovante

        Examples:
            | horario | dia_semana    | tipo_dia | valor_saque | valor_saldo | limite_especial | solicita_comprovante | sistema_imprime |
            | 7       | segunda-feira | útil     | 700         | 1000        | 200             | solicita             | imprime         |
            | 10      | quinta-feira  | útil     | 1000        | 900         | 200             | solicita             | imprime         |
            | 23      | sexta-feira   | feriado  | 100         | 0           | 100             | não solicita         | não imprime     |
            | 22      | domingo       | feriado  | 200         | 200         | 100             | não solicita         | não imprime     |
