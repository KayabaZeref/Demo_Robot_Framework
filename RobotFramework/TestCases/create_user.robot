*** Settings ***
Library           SeleniumLibrary
Library          DataDriver                           file=../Data/create_user.xlsx     sheet_name=user_information
Resource          ../Pageobjects/manage_user_page.resource
Resource          ../Pageobjects/login_page.resource
Resource          ../Pageobjects/base_page.resource

*** Keywords ***
Create New User With All Fields
    [Arguments]        ${first_name}        ${last_name}        ${gender}        ${type}    ${dob_day}      ${dob_month}     ${dob_year}            ${jd_day}         ${jd_month}           ${jd_year}
    Login Into Home Page
    Go To Manage User Page Successfully
    Click Create New User Button
    Fill In The New User Information    ${first_name}        ${last_name}        ${gender}        ${type}    ${dob_day}      ${dob_month}     ${dob_year}            ${jd_day}         ${jd_month}           ${jd_year}
    Verify New User Create  ${first_name}        ${last_name}        ${gender}        ${type}    ${dob_day}      ${dob_month}     ${dob_year}            ${jd_day}         ${jd_month}           ${jd_year}

Go To Manage User Page Successfully
    Go To Manage User Page

*** Test Cases ***
Create New User With All Fields Successfully
    [Template]        Create New User With All Fields

