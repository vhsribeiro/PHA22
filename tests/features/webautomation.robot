*** Settings ***
Documentation        Aqui neste arquivo estarão presentes todos os tipos de
...                  variáveis que iremos estudar ao longo do treinamento.

Resource        ../../src/config/package.robot

Suite Setup            Abrir o meu navegador
Suite Teardown         Fechar navegador

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