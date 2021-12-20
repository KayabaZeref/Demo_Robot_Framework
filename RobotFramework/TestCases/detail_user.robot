*** Settings ***
Library           SeleniumLibrary
Resource          ../Pageobjects/login_page.resource
Resource          ../Pageobjects/manage_user_page.resource
Resource          ../Pageobjects/base_page.resource
#Test Teardown        Close All Browsers

*** Keywords ***
View Detail User
    Login Into Home Page
    Go To Manage User Page Successfully
    Get Detail Information From User To Verify  

Go To Manage User Page Successfully
    Go To Manage User Page

*** Test Cases ***
View Detail User Successfully
    [Template]           View Detail User



