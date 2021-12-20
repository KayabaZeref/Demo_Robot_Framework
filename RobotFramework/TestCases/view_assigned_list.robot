*** Settings ***
Library                 SeleniumLibrary
Resource                ../Pageobjects/base_page.resource
Resource                ../Pageobjects/manage_assignment_page.resource
Resource                ../Pageobjects/login_page.resource

*** Keywords ***
Login Into Home Page Successfully
    Login Into Home Page
    Go To Manage Assigned Page Successfully
    Verify Redirect To Assigned Page

Go To Manage Assigned Page Successfully
    Go To Manage Assigned Page

*** Test Cases ***
View Assigned List Successfully
    [Template]            Login Into Home Page Successfully
