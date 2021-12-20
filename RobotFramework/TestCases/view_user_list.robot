*** Settings ***
Library           SeleniumLibrary
Library             DataDriver            file=../Data/search.xlsx     sheet_name=search_user
Resource          ../Pageobjects/login_page.resource
Resource          ../Pageobjects/manage_user_page.resource
Resource          ../Pageobjects/base_page.resource
#Test Teardown        Close All Browsers

*** Keywords ***
Login Into Home Page Successfully
    Login Into Home Page
    Go To Manage User Page Successfully
    Verify Redirect To User Page

Go To Manage User Page Successfully
    Go To Manage User Page

*** Test Cases ***
View User List Successfully
    [Template]            Login Into Home Page Successfully




