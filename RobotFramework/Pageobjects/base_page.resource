*** Settings ***
Library           SeleniumLibrary
Resource          ../conf/conf_env.resource

*** Keywords ***
Base Wait Until Element Is Clickable
    [Arguments]     ${locator}
    Wait Until Element Is Visible    ${locator}
    Wait Until Element Is Enabled   ${locator}

Base Wait Until Element Is Visible
    [Arguments]     ${locator}
    Wait Until Element Is Visible    ${locator}

Base Input Text
    [Arguments]        ${locator}        ${value}
    Wait Until Element Is Visible        ${locator}
    Input Text       ${locator}        ${value}

Base Element Text Should Be
    [Arguments]     ${locator}      ${message}
    Wait Until Element Is Visible    ${locator}
    Element Text Should Be       ${locator}      ${message}

Base Click Element
    [Arguments]     ${locator}
    Base Wait Until Element Is Clickable   ${locator}
    Click Element    ${locator}
    
Base Open Browser 
    Open Browser     \   ${BROWSER}
    Maximize Browser Window
    
Base Navigate To Url 
    [Arguments]        ${value}
    Go To         ${value}

Base Scroll Page
    Execute JavaScript           window.scrollTo(0, document.body.scrollHeight)

Base Should Contain
    [Arguments]     ${container}    ${item}
    Should Contain    ${container}    ${item}

