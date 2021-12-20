*** Settings ***
Library                 SeleniumLibrary
Library                 DataDriver            file=../Data/filter_asset.xlsx    
Resource                ../Pageobjects/base_page.resource
Resource                ../Pageobjects/manage_asset_page.resource
Resource                ../Pageobjects/login_page.resource

*** Keywords ***
Filter Asset By Category
    [Arguments]        ${filter_asset_category}
    Login Into Home Page
    Go To Manage Asset Page Successfully
    Filter Asset Category    ${filter_asset_category}
    
    #Verify filter Correctly
   ${filter_result}=    Get WebElements    xpath= //table[@class="table"]//td[3]
   #tr[@class]
    FOR    ${result}    IN    @{filter_result}
        ${text}=    Get Text    ${result}
        Should Contain    ${text.lower()}        ${filter_asset_category.lower()}    
    END

Go To Manage Asset Page Successfully
    Go To Manage Asset Page

*** Test Cases  ***
Filter Asset Category Successfully
    [Template]        Filter Asset By Category