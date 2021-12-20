*** Settings ***
Library          SeleniumLibrary
Library          DataDriver         file=../Data/create_asset.xlsx    
Resource          ../Pageobjects/base_page.resource
Resource          ../Pageobjects/login_page.resource
Resource          ../Pageobjects/manage_asset_page.resource

*** Keywords ***
Create New Asset With All Fields
    [Arguments]        ${create_asset_name}      ${create_asset_category}    ${create_asset_specification}     ${create_asset_day}    ${create_asset_month}     ${create_asset_year}    ${create_asset_state}
    Login Into Home Page
    Go To Manage Asset Page Successfully
    Click Create New Asset Button
    Fill In The New Asset Information    ${create_asset_name}      ${create_asset_category}    ${create_asset_specification}     ${create_asset_day}    ${create_asset_month}   ${create_asset_year}  ${create_asset_state}
    Verify New Asset Create  ${create_asset_name}      ${create_asset_category}    ${create_asset_specification}     ${create_asset_day}    ${create_asset_month}       ${create_asset_year}   ${create_asset_state}

Go To Manage Asset Page Successfully
    Go To Manage Asset Page

*** Test Cases ***
Create New Asset With All Fields Successfully
    [Template]        Create New Asset With All Fields

