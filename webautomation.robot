*** Settings ***
Documentation        Aqui neste arquivo estarão presentes todos os tipos de
...                  variáveis que iremos estudar ao longo do treinamento.

Library              SeleniumLibrary
Library    OperatingSystem
Library    DebugLibrary


Suite Setup            Abrir o meu navegador
Suite Teardown         Fechar navegador


*** Variables ***
${URL}         https://learningprime.com.br/
${BROWSER}     chrome


*** Test Cases ***
Cenario: Buscando uma Bag
    [Tags]        BAG
    Dado que eu esteja na tela Home do site
    Quando pesquisar o produto    Bag
    Então o produto deve ser apresentado com sucesso
    E a seguinte mensagem deve ser apresentada    Resultados da busca por 'Bag'

Cenario: Buscar Mug com sucesso
    [Tags]        MUG
    Dado que eu esteja na tela Home do site
    Quando pesquisar o produto    Mug
    Então o Mug deve ser apresentado com sucesso
    E a seguinte mensagem deve ser apresentada    Resultados da busca por 'Mug'

Cenario: Validando cadastro com sucesso no learningprime
    [Tags]        SIGNUP
    Dado que eu esteja na tela de cadastro
    E informe todos os dados necessários
    Quando finalizar o cadastro
    Então devo ser direcionado para a tela Home do site
    E a seguinte mensagem deve ser apresentada.

Cenario: Validar login com senha incorreta
    [Tags]        SUITE
    Dado que eu esteja na tela de login
    Quando informar uma senha incorreta
    Entao a mensagem "email ou senha inválida" deve ser apresentada

Cenario: Validar login com email incorreto
    [Tags]        SUITE
    Dado que eu esteja na tela de login
    Quando informar um usuário incorreto
    Entao a mensagem "email ou senha inválida" deve ser apresentada


*** Keywords ***
############################################################################################################################
#                                        Cenario: Validando cadastro com sucesso no learningprime                          #
############################################################################################################################
Dado que eu esteja na tela de login
    Wait Until Element Is Visible    xpath=//a[@href='/login']
    Click Element    xpath=//a[@href='/login']
    Wait Until Element Is Visible    xpath=//a[@href='/signup']
    Click Element    xpath=//input[@value='Entrar']
Quando informar uma senha incorreta
    Input Text    id=spree_user_email                     vic5@teste.com.br
    Input Password    id=spree_user_password                 123456
    Click Element    xpath=//input[@value='Entrar']
Entao a mensagem "email ou senha inválida" deve ser apresentada
    Element Text Should Be    xpath=//div[@class='flash error']    Email ou senha inválida.

Quando informar um usuário incorreto
    Input Text    id=spree_user_email                     vic1115@teste.com.br
    Input Password    id=spree_user_password                 123456789

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


############################################################################################################################
#                                                                                                                          #
############################################################################################################################
Dado que eu esteja na tela Home do site
    Title Should Be    Learning Prime Store
    Wait Until Element Is Visible    xpath=//*[contains(text(), 'Comprar por Categories')]    10

Quando pesquisar o produto
    [Arguments]    ${PRODUTO}
    Input Text    xpath=//input[@placeholder='Busca' and @type='search' and @id='keywords']    ${PRODUTO}
    Click Element    xpath=//input[@type='submit' and @value='Busca']

Então o produto deve ser apresentado com sucesso
    Wait Until Page Contains    Resultados da busca por 'Bag'
    Page Should Contain Image    xpath=//img[@src='/spree/products/23/small/ror_bag.jpeg?1552494900']
        Sleep    2
    
Abrir o meu navegador    
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

Fechar navegador   
    Capture Page Screenshot 
    Close Browser

Então o Mug deve ser apresentado com sucesso
    Wait Until Page Contains    Resultados da busca por 'Mug'
    Page Should Contain Image    xpath=//img[@src='/spree/products/27/small/ror_mug.jpeg?1552494901']
        Sleep    2

E a seguinte mensagem deve ser apresentada
    [Arguments]    ${MESSAGE}
    Wait Until Page Contains    ${MESSAGE}
