*** Settings ***
Library                 SeleniumLibrary
Library                 DataDriver            file=../Data/filter_assigned.xlsx    
Resource                ../Pageobjects/base_page.resource
Resource                ../Pageobjects/manage_assignment_page.resource
Resource                ../Pageobjects/login_page.resource

*** Keywords ***
Filter Assigned By Date
    [Arguments]        ${filter_assigned_day}       ${filter_assigned_month}      ${filter_assigned_year}
    Login Into Home Page
    Go To Manage Assigned Page Successfully
    Filter Assigned Date    ${filter_assigned_day}       ${filter_assigned_month}      ${filter_assigned_year}
    
    #Verify filter Correctly
   ${filter_result}=    Get WebElements    xpath= //table[@class="table"]//td[6]
   #tr[@class]
    FOR    ${result}    IN    @{filter_result}
        ${text}=    Get Text    ${result}
        Should Contain    ${text}        ${filter_assigned_day}/${filter_assigned_month}/${filter_assigned_year}   
    END

Go To Manage Assigned Page Successfully
    Go To Manage Assigned Page

*** Test Cases  ***
Filter Assigned Date Successfully
    [Template]        Filter Assigned By Date