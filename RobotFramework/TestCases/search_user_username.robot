*** Settings ***
Library           SeleniumLibrary
Library           DataDriver            file=../Data/search.xlsx            sheet_name=search_user
Resource          ../Pageobjects/login_page.resource
Resource          ../Pageobjects/manage_user_page.resource
Resource          ../Pageobjects/base_page.resource
#Test Teardown        Close All Browsers

*** Keywords ***
Search User By UserName
    [Arguments]        ${username}    
    Login Into Home Page
    Go To Manage User Page Successfully
    Input Search User By UserName        ${username} 
    #Verify Search Correctly
    ${search_result}=    Get WebElements    xpath= //table[@class="table"]//tr/td[3]
    FOR    ${result}    IN    @{search_result}
        ${text}=    Get Text    ${result}
        Should Contain    ${text.lower()}        ${username.lower()}    
    END

Go To Manage User Page Successfully
    Go To Manage User Page

*** Test Cases ***
Search User By UserName Successfully
    [Template]           Search User By UserName



