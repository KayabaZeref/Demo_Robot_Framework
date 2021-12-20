*** Settings ***
Library           SeleniumLibrary
Library           DataDriver            file=../Data/search_assignment.xlsx      
Resource          ../Pageobjects/login_page.resource
Resource          ../Pageobjects/manage_assignment_page.resource
Resource          ../Pageobjects/base_page.resource
#Test Teardown        Close All Browsers

*** Keywords ***
Search Assigned By Asset Code 
    [Arguments]        ${search_asset_code}    
    Login Into Home Page
    Go To Manage Assigned Page Successfully
    Input Search Assigned By Asset Code          ${search_asset_code}  
    #Verify Search Correctly
    ${search_result}=    Get WebElements    xpath= //table[@class="table"]//tr/td[2]
    FOR    ${result}    IN    @{search_result}
        ${text}=    Get Text    ${result}
        Should Contain    ${text.lower()}        ${search_asset_code.lower()}    
    END

Go To Manage Assigned Page Successfully
    Go To Manage Assigned Page

*** Test Cases ***
Search Assigned By Asset Code Successfully
    [Template]           Search Assigned By Asset Code 




