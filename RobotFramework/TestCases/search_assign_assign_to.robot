*** Settings ***
Library           SeleniumLibrary
Library           DataDriver            file=../Data/search_assignment.xlsx      
Resource          ../Pageobjects/login_page.resource
Resource          ../Pageobjects/manage_assignment_page.resource
Resource          ../Pageobjects/base_page.resource

*** Keywords ***
Search Assigned By Assigned To 
    [Arguments]        ${search_assigned_to}     
    Login Into Home Page
    Go To Manage Assigned Page Successfully
    Input Search Assigned By Assigned To          ${search_assigned_to}   
    #Verify Search Correctly
    ${search_result}=    Get WebElements    xpath= //table[@class="table"]//tr/td[4]
    FOR    ${result}    IN    @{search_result}
        ${text}=    Get Text    ${result}
        Should Contain    ${text.lower()}        ${search_assigned_to.lower()}    
    END

Go To Manage Assigned Page Successfully
    Go To Manage Assigned Page

*** Test Cases ***
Search Assigned By Assigned To Successfully
    [Template]           Search Assigned By Assigned To




