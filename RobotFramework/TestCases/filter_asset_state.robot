*** Settings ***
Library                 SeleniumLibrary
Library                 DataDriver            file=../Data/filter_asset.xlsx    
Resource                ../Pageobjects/base_page.resource
Resource                ../Pageobjects/manage_asset_page.resource
Resource                ../Pageobjects/login_page.resource

*** Keywords ***
Filter Asset By State
    [Arguments]        ${filter_asset_state}
    Login Into Home Page
    Go To Manage Asset Page Successfully
    Filter Asset State    ${filter_asset_state}
    
    #Verify filter Correctly
   ${filter_result}=    Get WebElements    xpath= //table[@class="table"]//td[4]
   #tr[@class]
    FOR    ${result}    IN    @{filter_result}
        ${text}=    Get Text    ${result}
        Should Contain    ${text.lower()}        ${filter_asset_state.lower()}    
    END

Go To Manage Asset Page Successfully
    Go To Manage Asset Page

*** Test Cases  ***
Filter Asset State Successfully
    [Template]        Filter Asset By State