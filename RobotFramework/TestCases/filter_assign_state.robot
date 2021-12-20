*** Settings ***
Library                 SeleniumLibrary
Library                 DataDriver            file=../Data/filter_assigned.xlsx    
Resource                ../Pageobjects/base_page.resource
Resource                ../Pageobjects/manage_assignment_page.resource
Resource                ../Pageobjects/login_page.resource

*** Keywords ***
Filter Assigned By State
    [Arguments]        ${filter_assigned_state}
    Login Into Home Page
    Go To Manage Assigned Page Successfully
    Filter Assigned State    ${filter_assigned_state}
    
    #Verify filter Correctly
   ${filter_result}=    Get WebElements    xpath= //table[@class="table"]//td[7]
   #tr[@class]
    FOR    ${result}    IN    @{filter_result}
        ${text}=    Get Text    ${result}
        Should Contain    ${text.lower()}        ${filter_assigned_state.lower()}    
    END

Go To Manage Assigned Page Successfully
    Go To Manage Assigned Page

*** Test Cases  ***
Filter Assigned State Successfully
    [Template]        Filter Assigned By State