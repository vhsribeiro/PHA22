*** Settings ***

Documentation        Keywords Home/Busca

Resource            ../../src/config/package.robot

*** Keywords ***

Dado que eu esteja na tela Home do site
    Title Should Be                        Learning Prime Store
    Wait Until Page Contains               Comprar por Categories

Quando pesquisar o produto
    [Arguments]                            ${PRODUTO}
    Input Text                             ${HOME.INPUT_BUSCA}    ${PRODUTO}
    Click Element                          ${HOME.BTN_BUSCAR}

Então o produto deve ser apresentado com sucesso
    Wait Until Page Contains               Resultados da busca por 'Bag'
    Page Should Contain Image              ${HOME.IMG_BAG}
        Sleep                              2
    


Então o Mug deve ser apresentado com sucesso
    Wait Until Page Contains               Resultados da busca por 'Mug'
    Page Should Contain Image              ${HOME.IMG_MUG}
        Sleep                              2

E a seguinte mensagem deve ser apresentada
    [Arguments]                           ${MESSAGE}
    Wait Until Page Contains              ${MESSAGE}