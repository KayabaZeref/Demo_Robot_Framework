*** Settings ***
Library           SeleniumLibrary
Library           DataDriver            file=../Data/user_login.xlsx            sheet_name = change_password
Resource          ../Pageobjects/login_page.resource
Resource          ../Pageobjects/base_page.resource

*** Keywords ***
Login Into Home Page Successfully
    [Arguments]     ${change_password_confirm_msg}
    Login Into Home Page
    Change New Password Diffirent From Old Password 
    Click Save New Password Button
    Confirm Change Password Message     ${change_password_confirm_msg}
    Login Again To Confirm Change Password Successfully

*** Test Cases ***
Change Password Successfully
    [Template]            Login Into Home Page Successfully




