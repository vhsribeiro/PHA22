*** Settings ***
Documentation        Neste arquivo estarão presentes todos os exercícios de IF e FOR.
Library    String

*** Variables ***
${SIMPLES}
@{LISTA}
&{DICIONARIO}

${NOME}        Maria


*** Test Cases ***
Contando de 0 a 9
    [Tags]        CONTAR
    Contar de 0 a 9

Contando a lista de FRUTAS
    [Tags]        FRUTAS
    Percorrer itens de uma Lista

Exercício do FOR
    [Tags]        F1
    Exercício do FOR

Imprimindo países
    [Tags]        Pais
    Imprirmir lista de países


Imprimindo nome por decisão
    [Tags]    NOME
    Tomar decisões

mostrar 5 ou 8
    [Tags]    58
    Exercicio do IF



*** Keywords ***
Contar de 0 a 9
    FOR    ${count}    IN RANGE    0    9    
        Log To Console    ${count}
        
    END
Percorrer itens de uma Lista
    @{FRUTAS}    Create List    Morango    Banana    Abacaxi    Uva    Melancia
    FOR    ${FRUTA}    IN    @{FRUTAS}
        Log To Console    ${FRUTA}
        
    END

Exercício do FOR
    FOR   ${COUNT}    IN RANGE    0    11
        Log To Console    Estou no número: ${COUNT}
    END

Imprirmir lista de países
    @{PAISES}    Create List        BRASIL    HOLANDA    MEXICO    ARGENTINA    JAPÃO    
    FOR    ${PAIS}    IN    @{PAISES}
        Log To Console    Eu vou conhecer:    ${PAIS}    
    END

Tomar decisões
    IF    '${NOME}'=='Maria'
        Log To Console    Vou fazer isso só quando for a Maria
    ELSE IF    '${NOME}'=='João'
        Log To Console    Vou fazer isso só quando for o João
    ELSE
        Log To Console    Vou fazer isso quando eu quiser.
    END


Exercicio do IF
    FOR    ${numero}    IN RANGE    0    11
        IF    ${numero}==5
            Log To Console    Estou no número: ${numero}
        ELSE IF    ${numero}==8
            Log To Console    Estou no número: ${numero}
        ELSE
            Log To Console    Não sou 5, nem 8.
       END
    END