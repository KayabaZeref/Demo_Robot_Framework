*** Settings ***
Library           SeleniumLibrary
Resource          ../Pageobjects/login_page.resource
Resource          ../Pageobjects/manage_asset_page.resource
Resource          ../Pageobjects/base_page.resource

*** Keywords ***
View Detail Asset
    Login Into Home Page
    Go To Manage Asset Page Successfully
    Get Detail Information From Asset To Verify  

Go To Manage Asset Page Successfully
    Go To Manage Asset Page

*** Test Cases ***
View Detail Asset Successfully
    [Template]           View Detail Asset



