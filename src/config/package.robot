*** Settings ***

Documentation    Gerenciados de dependências. Usar Resource pra puxar pro resto.

Library    SeleniumLibrary
Library    OperatingSystem
Library    DebugLibrary
Library    FakerLibrary

Resource    ../keywords/kws_login.robot
Resource    ../keywords/kws_cadastro.robot
Resource    ../keywords/kws_busca.robot

Resource    ../pages/cadastro_page.robot
Resource    ../pages/home_page.robot
Resource    ../pages/login_page.robot

Resource    hooks.robot
