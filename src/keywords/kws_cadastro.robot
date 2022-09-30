*** Settings ***

Documentation    Keywords do teste de cadastro

Resource    ../../src/config/package.robot

*** Keywords ***

Dado que eu esteja na tela de cadastro
    Wait Until Element Is Visible    xpath=//a[@href='/login']
    Click Element    xpath=//a[@href='/login']
    Debug
    Wait Until Element Is Visible    xpath=//a[@href='/signup']
    Click Element    xpath=//a[@href='/signup']
    
    Wait Until Page Contains    Novo Cliente

E informe todos os dados necessários
    Input Text    id=spree_user_email                     vic5@teste.com.br
    Input Password    id=spree_user_password                 123456789
    Input Password    id=spree_user_password_confirmation    123456789
    
Quando finalizar o cadastro
    Click Element    xpath=//*[@value='Criar' and @type='submit']

Então devo ser direcionado para a tela Home do site
    Wait Until Element Is Visible    xpath=//a[@href='/account']

E a seguinte mensagem deve ser apresentada.
    Wait Until Page Contains    Bem vindo! Seu cadastro foi feito com sucesso.
    Sleep    2