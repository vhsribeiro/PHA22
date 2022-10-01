*** Settings ***

Documentation        Keywords do teste de login

Resource             ../../src/config/package.robot

*** Keywords ***

Dado que eu esteja na tela de login
    Wait Until Element Is Visible    ${HOME.BTN_ENTRAR}
    Click Element                    ${HOME.BTN_ENTRAR}
    Wait Until Element Is Visible    ${LOGIN.BTN_CADASTRO}
    Click Element                    ${LOGIN.BTN_ENTRAR}
Quando informar uma senha incorreta
    Input Text                       ${LOGIN.INPUT_EMAIL}              vic5@teste.com.br
    Input Password                   ${LOGIN.INPUT_SENHA}              123456
    Click Element                    ${LOGIN.BTN.ENTRAR}
Entao a mensagem "email ou senha inválida" deve ser apresentada
    Element Text Should Be           ${LOGIN.ERROR_MESSAGE}            Email ou senha inválida.

Quando informar um usuário incorreto
    Input Text                       ${LOGIN.INPUT_EMAIL}              vic1115@teste.com.br
    Input Password                   ${LOGIN.INPUT_SENHA}              123456789