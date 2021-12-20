*** Settings ***
Library           SeleniumLibrary
Library           DataDriver            file=../Data/search_asset.xlsx      
Resource          ../Pageobjects/login_page.resource
Resource          ../Pageobjects/manage_asset_page.resource
Resource          ../Pageobjects/base_page.resource
#Test Teardown        Close All Browsers

*** Keywords ***
Search Asset By Asset Code 
    [Arguments]        ${search_asset_name}    
    Login Into Home Page
    Go To Manage Asset Page Successfully
    Input Search Asset By Asset Name          ${search_asset_name}  
    #Verify Search Correctly
    ${search_result}=    Get WebElements    xpath= //table[@class="table"]//tr/td[2]
    FOR    ${result}    IN    @{search_result}
        ${text}=    Get Text    ${result}
        Should Contain    ${text.lower()}        ${search_asset_name.lower()}    
    END

Go To Manage Asset Page Successfully
    Go To Manage Asset Page

*** Test Cases ***
Search Asset By Asset Code Successfully
    [Template]           Search Asset By Asset Code 




