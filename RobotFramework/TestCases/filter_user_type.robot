*** Settings ***
Library                 SeleniumLibrary
Library                 DataDriver            file=../Data/filter.xlsx     sheet_name=filter_user
Resource                ../Pageobjects/base_page.resource
Resource                ../Pageobjects/manage_user_page.resource
Resource                ../Pageobjects/login_page.resource

*** Keywords ***
Filter User Sucessfully By ADMIN
    [Arguments]        ${filter_type}
    Login Into Home Page
    Go To Manage User Page
    Filter User List    ${filter_type}
    
    #Verify filter Correctly
   ${filter_result}=    Get WebElements    xpath= //table[@class="table"]//td[5]
   #tr[@class]
    FOR    ${result}    IN    @{filter_result}
        ${text}=    Get Text    ${result}
        Should Contain    ${text.lower()}        ${filter_type.lower()}    
    END

*** Test Cases  ***
Filter User Successfully
    [Template]        Filter User Sucessfully By ADMIN