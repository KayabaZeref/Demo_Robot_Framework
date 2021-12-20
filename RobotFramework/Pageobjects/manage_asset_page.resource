*** Settings ***
Library           SeleniumLibrary
Library           String
Library           DataDriver            file=../Data/search_asset.xlsx            
Library           DataDriver            file=../Data/create_asset.xlsx    
Library           DataDriver            file=../Data/filter_asset.xlsx            
Resource          ../conf/conf_env.resource
Resource          base_page.resource

*** Variables ***
#View Asset
${BTN_ASSET_PAGE_LOCATOR}           CSS   = a[href="/Manager Asset"]>button
${TXT_ASSET_LIST_LOCATOR}           xpath = //div[@class ="table-container"]
${BTN_CREATE_NEW_ASSET_LOCATOR}     CSS   = a[href="/Manager Asset/Create New Asset"]

${COL_ASSET_CODE_LOCATOR}           xpath = //a[text()="Asset Code"] 
${COL_ASSET_NAME_LOCATOR}           xpath = //a[text()="Asset Name"] 
${COL_CATEGORY_LOCATOR}             xpath = //a[text()="Category"] 
${COL_STATE_LOCATOR}                xpath = //a[text()="State"] 

${TXT_SEARCH_ASSET_LOCATOR}          xpath = //div[@class="input-group border"]/input[@type="text"]
${BTN_SEARCH_ASSET_LOCATOR}          xpath = //div[@class="input-group border"]/span

${BTN_NEXT_USER_LIST_LOCATOR}       xpath = //a[@class="pagination__link" and text()="Next"]
${BTN_PREVIOUS_USER_LIST_LOCATOR}   xpath = //a[@class="pagination__link" and text()="Previous"]
${TXT_ASSET_COL_LOCATOR}             xpath = //tr[@style="font-weight: normal;"]

#filter asset
${DOP_FILTER_CATEGORY_LOCATOR}        xpath = //button[@type="button"]/span[text()="Category"]
${DOP_FILTER_STATES_LOCATOR}          xpath = //button[@type="button"]/span[text()="States"]

#Verify Asset
${ROW_POSTION_ASSET_TO_VERIFY}       [1]
${VERIFY_ASSET_CODE_LOCATOR}        xpath = //div[text()="Asset Code"]//following-sibling::div[1]
${VERIFY_ASSET_NAME_LOCATOR}        xpath = //div[text()="Asset Name"]//following-sibling::div[1]
${VERIFY_CATEGORY_LOCATOR}          xpath = //div[text()="Category"]//following-sibling::div[1]
${VERIFY_STATE_LOCATOR}             xpath = //div[text()="State"]//following-sibling::div[1]
${VERIFY_INSTALLED_DATE_LOCATOR}    xpath = //div[text()="Installed Date"]//following-sibling::div[1]

#Create Asset
${TBL_CREATE_NEW_ASSET_LOCATOR}     CSS   = div[class=row]
${BTN_SAVE_DISABLE_LOCATOR}         xpath = //button[@disabled and text()="Save"]
${TXT_ASSET_NAME_LOCATOR}           xpath = //div[@id="textbox"]//input[@name="assetName"]
${DOP_CATEGORY_LOCATOR}             xpath = //select[contains(@title,"label: Category")]
${TXT_SPECIFICATION_LOCATOR}        xpath = //textarea[@label="Specification"]
${DTP_INSTALLED_DATE_LOCATOR}       xpath = //input[@name="installedDate"]
${CHK_STATE_LOCATOR}                xpath = //label[text()="State"]/following-sibling::div
${DDL_TYPE_LOCATOR}                 xpath = //label[text()="Type"]/following-sibling::div
${BTN_CREATE_ASSET_SAVE_LOCATOR}    xpath = //button[@type="submit" and text()="Save"]
${BTN_CANCEL_LOCATOR}               xpath = //a[text()="Cancel"]

#Disable User
${ROW_POSTION_USER_TO_DISABLE}              [4]
${TXT_DISABLE_CONFIRM_MESSAGE_LOCATOR}      xpath = //div[@class="text-center"]
${BTN_DISABLE_CONFIRM_LOCATOR}              xpath = //button[text()="Disable"]

#Edit User
${ROW_POSTION_USER_TO_EDIT}                 [4]
${DTP_DOB_EDIT_LOCATOR}                     xpath = //input[@name="dateOfBirth"]
${ROB_GENDER_EDIT_LOCATOR}                  xpath = //label[text()="Gender"]//following-sibling::div
${DTP_JOINED_DATE_EDIT_LOCATOR}             xpath = //input[@name="joinedDate"]
${DDL_TYPE_EDIT_LOCATOR}                    xpath = //label[text()="Type"]/following-sibling::div
${BTN_EDIT_SAVE_LOCATOR}                    xpath = //button[text()="Save"]

*** Keywords ***
#Main Keywords
Wait For Asset List To Load Successfully
    Base Wait Until Element Is Visible  ${TXT_ASSET_LIST_LOCATOR}

#View Asset List
Go To Manage Asset Page
    Base Click Element    ${BTN_ASSET_PAGE_LOCATOR}

Verify Redirect To Asset Page
    Wait For Asset List To Load Successfully
    Verify Create New Asset Button

Verify Create New Asset Button
    Base Wait Until Element Is Visible  ${BTN_CREATE_NEW_ASSET_LOCATOR}
    Verify Search Bar Appear

Verify Search Bar Appear
    Base Wait Until Element Is Visible  ${TXT_SEARCH_ASSET_LOCATOR} 
    Verify User List Column Data

Verify User List Column Data
    Base Wait Until Element Is Clickable    ${COL_ASSET_CODE_LOCATOR} 
    Base Wait Until Element Is Clickable    ${COL_ASSET_NAME_LOCATOR} 
    Base Wait Until Element Is Clickable    ${COL_CATEGORY_LOCATOR} 
    Base Wait Until Element Is Clickable    ${COL_STATE_LOCATOR}     
    Verify Next Button 

Verify Next Button 
    Base Click Element      ${BTN_NEXT_USER_LIST_LOCATOR}
    Verify Previous Button

Verify Previous Button
    Base Wait Until Element Is Clickable    ${BTN_PREVIOUS_USER_LIST_LOCATOR} 
    Base Click Element                      ${BTN_PREVIOUS_USER_LIST_LOCATOR}

#Search Asset
*** Keywords ***
Input Search Asset By Asset Code
    [Arguments]             ${search_asset_code} 
    Base Input Text         ${TXT_SEARCH_ASSET_LOCATOR}        ${search_asset_code}
    Click Search Button
    Wait Until Page Contains Element    xpath = //input[@value="${search_asset_code}"]
    #Code chay nhanh su dung phia tren van khong co tac dung 
    Sleep                   1s

Input Search Asset By Asset Name
    [Arguments]             ${search_asset_name}  
    Base Input Text         ${TXT_SEARCH_ASSET_LOCATOR}         ${search_asset_name}  
    Click Search Button
    Wait Until Page Contains Element    xpath = //input[@value="${search_asset_name}"]
     #Code chay nhanh su dung phia tren van khong co tac dung 
    Sleep                   1s

Click Search Button
    Base Click Element      ${BTN_SEARCH_ASSET_LOCATOR}

#Filter Asset
*** Keywords ***
Filter Asset Category
    [Arguments]     ${filter_asset_category}
    Click Filter Category Dropdown Menu
    Base Click Element      xpath = //div[text()="${filter_asset_category}"]
    #Code chay nhanh su dung phia tren ma bo ham Sleep van khong co tac dung 
    Sleep                   1s

Click Filter Category Dropdown Menu
    Base Click Element   ${DOP_FILTER_CATEGORY_LOCATOR}

Filter Asset State
    [Arguments]     ${filter_asset_state}
    Click Filter States Dropdown Menu
    Base Click Element      xpath = //div[text()="${filter_asset_state}"]
    #Code chay nhanh su dung phia tren ma bo ham Sleep van khong co tac dung 
    Sleep       1s   

Click Filter States Dropdown Menu
    Base Click Element   ${DOP_FILTER_STATES_LOCATOR}

#Detail Asset
*** Keywords ***
Get Detail Information From Asset To Verify
    Wait For Asset List To Load Successfully
    ${asset_code_value}  Get Text     ${TXT_ASSET_COL_LOCATOR}${ROW_POSTION_ASSET_TO_VERIFY}/td[1]
    ${asset_name_value}  Get Text     ${TXT_ASSET_COL_LOCATOR}${ROW_POSTION_ASSET_TO_VERIFY}/td[2]
    ${category_value}    Get Text     ${TXT_ASSET_COL_LOCATOR}${ROW_POSTION_ASSET_TO_VERIFY}/td[3]
    ${state_value}       Get Text     ${TXT_ASSET_COL_LOCATOR}${ROW_POSTION_ASSET_TO_VERIFY}/td[4]
    Click On User Row To View Asset Detail Information
    Base Wait Until Element Is Visible  ${VERIFY_STATE_LOCATOR}
    #Verify 
    Element Text Should Be      ${VERIFY_ASSET_CODE_LOCATOR}            ${asset_code_value}
    Element Text Should Be      ${VERIFY_ASSET_NAME_LOCATOR}            ${asset_name_value}
    Element Text Should Be      ${VERIFY_CATEGORY_LOCATOR}              ${category_value}
    Element Text Should Be      ${VERIFY_STATE_LOCATOR}                 ${state_value}
 
Click On User Row To View Asset Detail Information
    Base Click Element  ${TXT_ASSET_COL_LOCATOR}${ROW_POSTION_ASSET_TO_VERIFY}

#Create New Asset
*** Keywords ***
Click Create New Asset Button
    Base Click Element  ${BTN_CREATE_NEW_ASSET_LOCATOR} 

Fill In The New Asset Information
    [Arguments]      ${create_asset_name}      ${create_asset_category}    ${create_asset_specification}     ${create_asset_day}    ${create_asset_month}       ${create_asset_year}  ${create_asset_state}
    Base Wait Until Element Is Visible      ${TBL_CREATE_NEW_ASSET_LOCATOR} 
    Verify Save Button Is Disabled
    Base Input Text                         ${TXT_ASSET_NAME_LOCATOR}         ${create_asset_name}
    Click Category Dropdown Menu
    Base Click Element                      ${DOP_CATEGORY_LOCATOR}/option[@value="${create_asset_category}"]
    Base Input Text                         ${TXT_SPECIFICATION_LOCATOR}    ${create_asset_specification}                    
    Base Input Text                         ${DTP_INSTALLED_DATE_LOCATOR}                       ${create_asset_month}/${create_asset_day}/${create_asset_year}
    Press Keys                              None                                    ESC
    Base Click Element                      ${CHK_STATE_LOCATOR}//label[text()="${create_asset_state}"]         
    Click Save Button To Create

Verify Save Button Is Disabled
    Element Should Be Visible               ${BTN_SAVE_DISABLE_LOCATOR} 

Click Category Dropdown Menu
    Base Click Element  ${DOP_CATEGORY_LOCATOR}

Click Save Button To Create
    Base Click Element                      ${BTN_CREATE_ASSET_SAVE_LOCATOR}

Verify New Asset Create
    [Arguments]     ${create_asset_name}      ${create_asset_category}    ${create_asset_specification}     ${create_asset_day}    ${create_asset_month}        ${create_asset_year}  ${create_asset_state}
    Base Wait Until Element Is Visible  ${BTN_CREATE_NEW_ASSET_LOCATOR}
    Click On User Row To View Asset Detail Information
    Base Wait Until Element Is Visible  ${VERIFY_STATE_LOCATOR}
    #Verify 
    Element Text Should Be      ${VERIFY_ASSET_NAME_LOCATOR}          ${create_asset_name}
    Element Text Should Be      ${VERIFY_CATEGORY_LOCATOR}            ${create_asset_category} 
    Element Text Should Be     ${VERIFY_INSTALLED_DATE_LOCATOR}       ${create_asset_day}/${create_asset_month}/${create_asset_year}
    Element Text Should Be      ${VERIFY_STATE_LOCATOR}               ${create_asset_state}
