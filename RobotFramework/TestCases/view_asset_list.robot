*** Settings ***
Library                 SeleniumLibrary
#Library                 DataDriver            file=../Data/filter.xlsx     sheet_name=filter_user
Resource                ../Pageobjects/base_page.resource
Resource                ../Pageobjects/manage_asset_page.resource
Resource                ../Pageobjects/login_page.resource

*** Keywords ***
Login Into Home Page Successfully
    Login Into Home Page
    Go To Manage Asset Page Successfully
    Verify Redirect To Asset Page

Go To Manage Asset Page Successfully
    Go To Manage Asset Page

*** Test Cases ***
View Asset List Successfully
    [Template]            Login Into Home Page Successfully
