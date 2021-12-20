*** Settings ***
Library           SeleniumLibrary
Library           DataDriver            file=../Data/edit_user.xlsx     
#sheet_name=edit
Resource          ../Pageobjects/login_page.resource
Resource          ../Pageobjects/manage_user_page.resource
Resource          ../Pageobjects/base_page.resource
#Test Teardown        Close All Browsers

*** Keywords ***
Edit User All Fields
    [Arguments]             ${edit_gender}      ${edit_type}    ${edit_dob_day}    ${edit_dob_month}   ${edit_dob_year}    ${edit_jd_day}      ${edit_jd_month}     ${edit_jd_year}
    Login Into Home Page
    Go To Manage User Page Successfully
    Click Edit User Button 
    Edit User Text Fields       ${edit_gender}      ${edit_type}    ${edit_dob_day}    ${edit_dob_month}   ${edit_dob_year}    ${edit_jd_day}      ${edit_jd_month}     ${edit_jd_year}
    Verify Edit User Detail     ${edit_gender}      ${edit_type}    ${edit_dob_day}    ${edit_dob_month}   ${edit_dob_year}    ${edit_jd_day}      ${edit_jd_month}     ${edit_jd_year}

Go To Manage User Page Successfully
    Go To Manage User Page

*** Test Cases ***
Edit User All Fields Successfully
    [Template]           Edit User All Fields



