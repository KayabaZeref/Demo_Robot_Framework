*** Settings ***
Library           SeleniumLibrary
Library           DataDriver            file=../Data/search.xlsx            sheet_name=search_user
Resource          ../Pageobjects/login_page.resource
Resource          ../Pageobjects/manage_user_page.resource
Resource          ../Pageobjects/base_page.resource
#Test Teardown        Close All Browsers

*** Keywords ***
Search User By Staff Code
    [Arguments]        ${staff_code}    ${staff_code_full}
    Login Into Home Page
    Go To Manage User Page Successfully
    Input Search User By Staff Code        ${staff_code}    ${staff_code_full}
    #Verify Search Correctly
    ${search_result}=    Get WebElements    xpath= //table[@class="table"]//tr/td[1]
    FOR    ${result}    IN    @{search_result}
        ${text}=    Get Text    ${result}
        Should Contain    ${text.lower()}        ${staff_code_full.lower()}    
    END

Go To Manage User Page Successfully
    Go To Manage User Page

*** Test Cases ***
Search User By Staff Code Successfully
    [Template]           Search User By Staff Code



