*** Settings ***
Library           SeleniumLibrary
Library           DataDriver            file=../Data/edit_asset.xlsx     sheet_name = edit
Resource          ../Pageobjects/login_page.resource
Resource          ../Pageobjects/manage_asset_page.resource
Resource          ../Pageobjects/base_page.resource

*** Keywords ***
Edit Asset All Fields
    [Arguments]                 ${edit_asset_name}      ${edit_asset_specification}    ${edit_asset_day}    ${edit_asset_month}     ${edit_asset_year}          ${edit_asset_state}   
    Login Into Home Page
    Go To Manage Asset Page Successfully
    Click Edit Asset Button 
    Edit Asset Text Fields       ${edit_asset_name}      ${edit_asset_specification}    ${edit_asset_day}    ${edit_asset_month}     ${edit_asset_year}          ${edit_asset_state} 
    Verify Edit Asset Detail     ${edit_asset_name}      ${edit_asset_specification}    ${edit_asset_day}    ${edit_asset_month}     ${edit_asset_year}          ${edit_asset_state} 

Go To Manage Asset Page Successfully
    Go To Manage Asset Page

*** Test Cases ***
Edit Asset All Fields Successfully
    [Template]           Edit Asset All Fields



