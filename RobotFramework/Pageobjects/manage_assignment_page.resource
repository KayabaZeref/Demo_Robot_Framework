*** Settings ***
Library           SeleniumLibrary
Library           String
Library           DataDriver            file=../Data/search_assignment.xlsx            
Library           DataDriver            file=../Data/filter_assigned.xlsx            
Resource          ../conf/conf_env.resource
Resource          base_page.resource

*** Variables ***
#View Assigned
${BTN_ASSIGNMENT_PAGE_LOCATOR}          CSS   = a[href="/Manage Assignment"]>button
${TXT_ASSIGNED_LIST_LOCATOR}            xpath = //div[@class ="table-container"]
${BTN_CREATE_NEW_ASSIGNMENT_LOCATOR}    xpath = //a[@href="/Home" and text()="Create new assignment"]

${COL_ASSET_CODE_LOCATOR}               xpath = //a[text()="Asset Code"] 
${COL_ASSET_NAME_LOCATOR}               xpath = //a[text()="Asset Name"] 
${COL_ASSIGNED_TO_LOCATOR}              xpath = //a[text()="Assigned to"]
${COL_ASSIGNED_BY_LOCATOR}              xpath = //a[text()="Assigned by"]
${COL_ASSIGNED_DATE _LOCATOR}           xpath = //a[text()="Assigned Date"]
${COL_STATE_LOCATOR}                    xpath = //a[text()="State"]

#Search Assigned
${TXT_SEARCH_ASSIGNED_LOCATOR}          xpath = //div[@class="input-group border"]/input[@type="text"]
${BTN_SEARCH_ASSIGNED_LOCATOR}          xpath = //div[@class="input-group border"]/span

${BTN_NEXT_USER_LIST_LOCATOR}           xpath = //a[@class="pagination__link" and text()="Next"]
${BTN_PREVIOUS_USER_LIST_LOCATOR}       xpath = //a[@class="pagination__link" and text()="Previous"]
${TXT_ASSIGNED_COL_LOCATOR}             xpath = //tr[@style="font-weight: normal; font-size: 16px;"]

#filter Assigned
${DTP_FILTER_ASSGINED_DATE_LOCATOR}     xpath = //input[@placeholder="Assigned Date"]
${DOP_FILTER_STATE_LOCATOR}             xpath = //button[@type="button"]/span[text()="State"]

*** Keywords ***
#Main Keywords
Wait For Assigned List To Load Successfully
    Base Wait Until Element Is Visible  ${TXT_ASSIGNED_LIST_LOCATOR}

#View Assigned List
Go To Manage Assigned Page
    Base Click Element    ${BTN_ASSIGNMENT_PAGE_LOCATOR}

Verify Redirect To Assigned Page
    Wait For Assigned List To Load Successfully
    Verify Create New Assigned Button

Verify Create New Assigned Button
    Base Wait Until Element Is Visible  ${BTN_CREATE_NEW_ASSIGNMENT_LOCATOR}
    Verify Search Bar Appear

Verify Search Bar Appear
    Base Wait Until Element Is Visible  ${TXT_SEARCH_ASSIGNED_LOCATOR} 
    Verify Assigned List Column Data

Verify Assigned List Column Data
    Base Wait Until Element Is Clickable    ${COL_ASSET_CODE_LOCATOR} 
    Base Wait Until Element Is Clickable    ${COL_ASSET_NAME_LOCATOR} 
    Base Wait Until Element Is Clickable    ${COL_ASSIGNED_TO_LOCATOR} 
    Base Wait Until Element Is Clickable    ${COL_ASSIGNED_BY_LOCATOR}              
    Base Wait Until Element Is Clickable    ${COL_ASSIGNED_DATE _LOCATOR}              
    Base Wait Until Element Is Clickable    ${COL_STATE_LOCATOR}              
    Verify Next Button 

Verify Next Button 
    Base Click Element      ${BTN_NEXT_USER_LIST_LOCATOR}
    Verify Previous Button

Verify Previous Button
    Base Wait Until Element Is Clickable    ${BTN_PREVIOUS_USER_LIST_LOCATOR} 
    Base Click Element                      ${BTN_PREVIOUS_USER_LIST_LOCATOR}

#Search Assigned
*** Keywords ***
Input Search Assigned By Asset Code
    [Arguments]             ${search_asset_code} 
    Base Input Text         ${TXT_SEARCH_ASSIGNED_LOCATOR}        ${search_asset_code}
    Click Search Button              
    Wait Until Page Contains Element    xpath = //input[@value="${search_asset_code}"]
    #Code chay nhanh su dung phia tren van khong co tac dung 
    Sleep                   1s

Input Search Assigned By Asset Name
    [Arguments]             ${search_asset_name}  
    Base Input Text         ${TXT_SEARCH_ASSIGNED_LOCATOR}         ${search_asset_name}  
    Click Search Button
    Wait Until Page Contains Element    xpath = //input[@value="${search_asset_name}"]
     #Code chay nhanh su dung phia tren van khong co tac dung 
    Sleep                   1s

Input Search Assigned By Assigned To
    [Arguments]             ${search_assigned_to}  
    Base Input Text         ${TXT_SEARCH_ASSIGNED_LOCATOR}         ${search_assigned_to}  
    Click Search Button
    Wait Until Page Contains Element    xpath = //input[@value="${search_assigned_to}"]
     #Code chay nhanh su dung phia tren van khong co tac dung 
    Sleep                   1s

Click Search Button
    Base Click Element      ${BTN_SEARCH_ASSIGNED_LOCATOR}

#Filter Assigned
*** Keywords ***
Filter Assigned Date
    [Arguments]     ${filter_assigned_day}       ${filter_assigned_month}      ${filter_assigned_year}
    Click Filter Assigned Date Dropdown Menu
    Base Input Text     ${DTP_FILTER_ASSGINED_DATE_LOCATOR}     ${filter_assigned_day}/${filter_assigned_month}/${filter_assigned_year}  
    Press Keys          None                                    ESC
    #Code chay nhanh su dung phia tren ma bo ham Sleep van khong co tac dung 
    Sleep                   1s

Click Filter Assigned Date Dropdown Menu
    Base Click Element   ${DTP_FILTER_ASSGINED_DATE_LOCATOR}

Filter Assigned State
    [Arguments]     ${filter_assigned_state}
    Click Filter States Dropdown Menu
    Base Click Element      xpath = //div[text()="${filter_assigned_state}"]
    #Code chay nhanh su dung phia tren ma bo ham Sleep van khong co tac dung 
    Sleep       1s   

Click Filter States Dropdown Menu
    Base Click Element   ${DOP_FILTER_STATE_LOCATOR}


    