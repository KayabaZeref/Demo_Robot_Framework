*** Settings ***
Library           SeleniumLibrary
Library             DataDriver            file=../Data/disable_user.xlsx     sheet_name=disable
Resource          ../Pageobjects/login_page.resource
Resource          ../Pageobjects/manage_user_page.resource
Resource          ../Pageobjects/base_page.resource
#Test Teardown        Close All Browsers

*** Keywords ***
Disable A User
    [Arguments]     ${disable_confirm_message}
    Login Into Home Page
    Go To Manage User Page Successfully
    Click Disable User Button   ${disable_confirm_message}

Go To Manage User Page Successfully
    Go To Manage User Page

*** Test Cases ***
Disable A User Successfully
    [Template]           Disable A User



