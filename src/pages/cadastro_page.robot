*** Settings ***

Documentation        Elementos da tela cadastro

*** Variables ***

&{CADASTRO}
...            BTN_CRIAR=//a[@href='/signup']
...            BTN_ENTRAR=//a[@href='/login']
...            INPUT_EMAIL=//input[@id='spree_user_email']
...            INPUT_SENHA=//input[@id='spree_user_password']
...            INPUT_SENHA_CONFIRMA=//input[@id='spree_user_password_confirmation']
...            BTN_CADASTRAR=//*[@value='Criar' and @type='submit']


