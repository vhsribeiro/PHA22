*** Settings ***

Documentation    Keywords do teste de cadastro

Resource    ../../src/config/package.robot

*** Keywords ***

Dado que eu esteja na tela de cadastro
    Wait Until Element Is Visible    ${CADASTRO.BTN_ENTRAR}
    Click Element                    ${CADASTRO.BTN_ENTRAR}
    Wait Until Element Is Visible    ${CADASTRO.BTN_CRIAR}
    Click Element                    ${CADASTRO.BTN_CRIAR}
    
    Wait Until Page Contains    Novo Cliente

E informe todos os dados necessários
    ${EMAIL_FAKER}    FakerLibrary.email
    ${PW_FAKER}       FakerLibrary.Password
    Input Text        ${CADASTRO.INPUT_EMAIL}                     ${EMAIL_FAKER}
    Input Password    ${CADASTRO.INPUT_SENHA}                     ${PW_FAKER}
    Input Password    ${CADASTRO.INPUT_SENHA_CONFIRMA}            ${PW_FAKER}
    
Quando finalizar o cadastro
    Click Element    ${CADASTRO.BTN_CADASTRAR}

Então devo ser direcionado para a tela Home do site
    Wait Until Element Is Visible    xpath=//a[@href='/account']

E a seguinte mensagem deve ser apresentada.
    Wait Until Page Contains    Bem vindo! Seu cadastro foi feito com sucesso.
    Sleep    2