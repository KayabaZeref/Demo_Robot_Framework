*** Settings ***
Library           SeleniumLibrary
Library           String
Library           DataDriver            file=../Data/search.xlsx            sheet_name=search_user
Library           DataDriver            file=../Data/filter.xlsx            sheet_name=filter_user
Library           DataDriver            file=../Data/create_user.xlsx       sheet_name=user_information
Library           DataDriver            file=../Data/edit_user.xlsx         
Resource          ../conf/conf_env.resource
Resource          base_page.resource

*** Variables ***
#View 
${BTN_USER_PAGE_LOCATOR}            CSS   = a[href="/Manager User"]>button
${TXT_USER_LIST_LOCATOR}            xpath = //div[text()="User List"]
${BTN_CREATE_NEW_USER_LOCATOR}      CSS   = a[href="/Manager User/Create New User"]

${COL_STAFF_CODE_LOCATOR}           xpath = //a[text()="Staff Code"] 
${COL_FULL_NAME_LOCATOR}            xpath = //a[text()="Full Name"] 
${COL_USERNAME_LOCATOR}             xpath = //a[text()="Username"] 
${COL_JOINED_DATE_LOCATOR}          xpath = //a[text()="Joined Date"] 
${COL_TYPE_LOCATOR}                 xpath = //a[text()="Type"] 

${TXT_SEARCH_USER_LOCATOR}          xpath = //div[@class="input-group border"]/input[@type="text"]
${BTN_SEARCH_USER_LOCATOR}          xpath = //div[@class="input-group border"]/span

${BTN_NEXT_USER_LIST_LOCATOR}       xpath = //a[@class="pagination__link" and text()="Next"]
${BTN_PREVIOUS_USER_LIST_LOCATOR}   xpath = //a[@class="pagination__link" and text()="Previous"]
${TXT_USER_COL_LOCATOR}             xpath = //tr[@style="font-weight: normal;"]

#filter
${DOP_FILTER_USER_LOCATOR}          xpath = //button[@type="button"]/span[text()="All"]

#Verify User 
${ROW_POSTION_USER_TO_VERIFY}       [1]
${VERIFY_STAFF_CODE_LOCATOR}        xpath = //div[text()="Staff Code:"]//following-sibling::div[1]
${VERIFY_FULL_NAME_LOCATOR}         xpath = //div[text()="Full Name:"]//following-sibling::div[1]
${VERIFY_USER_NAME_LOCATOR}         xpath = //div[text()="User Name:"]//following-sibling::div[1]
${VERIFY_DOB_LOCATOR}               xpath = //div[text()="Date of Birth:"]//following-sibling::div[1]
${VERIFY_GENDER_LOCATOR}            xpath = //div[text()="Gender:"]//following-sibling::div[1]
${VERIFY_JOINED_DATE_LOCATOR}       xpath = //div[text()="Joined Date:"]
${VERIFY_TYPE_LOCATOR}              xpath = //div[text()="Type:"]//following-sibling::div[1]

#Create User
${TXT_FIRST_NAME_LOCATOR}           xpath = //div[@id="textbox"]//input[@name="firstName"]
${TXT_LAST_NAME_LOCATOR}            xpath = //div[@id="textbox"]//input[@name="lastName"]
${DTP_DOB_LOCATOR}                  xpath = //label[text()="Date of Birth"]/following-sibling::div//input[1][@type="text"]
#${RDB_GENDER_LOCATOR}              xpath = //div[@id="textbox"]//input[@name="firstName"]
${DTP_JD_LOCATOR}                   xpath = //label[text()="Joined Date"]/following-sibling::div//input[1][@type="text"]
${DDL_TYPE_LOCATOR}                 xpath = //label[text()="Type"]/following-sibling::div
${BTN_CREATE_USER_SAVE_LOCATOR}     xpath = //button[@type="submit"]
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
Wait For User List To Load Successfully
    Base Wait Until Element Is Visible  ${TXT_USER_LIST_LOCATOR}

#View User List
Go To Manage User Page
    Base Click Element    ${BTN_USER_PAGE_LOCATOR}

Verify Redirect To User Page
    Base Wait Until Element Is Visible  ${TXT_USER_LIST_LOCATOR}
    Verify Create New Menu Button

Verify Create New Menu Button
    Base Wait Until Element Is Visible  ${BTN_CREATE_NEW_USER_LOCATOR}
    Verify Search Bar Appear

Verify Search Bar Appear
    Base Wait Until Element Is Visible  ${TXT_SEARCH_USER_LOCATOR} 
    Verify User List Column Data

Verify User List Column Data
    Base Wait Until Element Is Clickable    ${COL_STAFF_CODE_LOCATOR} 
    Base Wait Until Element Is Clickable    ${COL_FULL_NAME_LOCATOR} 
    Base Wait Until Element Is Clickable    ${COL_STAFF_CODE_LOCATOR} 
    Base Wait Until Element Is Clickable    ${COL_USERNAME_LOCATOR}     
    Base Wait Until Element Is Clickable    ${COL_JOINED_DATE_LOCATOR} 
    Base Wait Until Element Is Clickable    ${COL_TYPE_LOCATOR}   
    Verify Next Button 

Verify Next Button 
    Base Click Element      ${BTN_NEXT_USER_LIST_LOCATOR}
    Verify Previous Button

Verify Previous Button
    Base Wait Until Element Is Clickable    ${BTN_PREVIOUS_USER_LIST_LOCATOR} 
    Base Click Element                      ${BTN_PREVIOUS_USER_LIST_LOCATOR}

#Search User
*** Keywords ***
Input Search User By Staff Code
    [Arguments]             ${staff_code}   ${staff_code_full}
    Base Input Text         ${TXT_SEARCH_USER_LOCATOR}        ${staff_code}
    Click Search Button
    Wait Until Page Contains Element    xpath = //input[@value="${staff_code}"]
    #Code chay nhanh su dung phia tren van khong co tac dung 
    Sleep                   1s

Input Search User By UserName
    [Arguments]             ${username}
    Base Input Text         ${TXT_SEARCH_USER_LOCATOR}        ${username}
    Click Search Button
    Wait Until Page Contains Element    xpath = //input[@value="${username}"]
     #Code chay nhanh su dung phia tren van khong co tac dung 
    Sleep                   1s

Click Search Button
    Base Click Element      ${BTN_SEARCH_USER_LOCATOR}

#Filter User
*** Keywords ***
Filter User List
    [Arguments]     ${filter_type}
    Click Filter Dropdown Menu
    Base Click Element      xpath = //div[text()="${filter_type}"]
    Wait Until Page Contains Element    xpath = //button[@type="button"]/span[text()="${filter_type}"]      
    #Code chay nhanh su dung phia tren ma bo ham Sleep van khong co tac dung 
    Sleep                   1s

Click Filter Dropdown Menu
    Base Click Element   ${DOP_FILTER_USER_LOCATOR}

#Detail User
*** Keywords ***
Get Detail Information From User To Verify
    Wait For User List To Load Successfully
#    Sleep                   3s
    ${staff_code_value}    Get Text    ${TXT_USER_COL_LOCATOR}${ROW_POSTION_USER_TO_VERIFY}/td[1]
    ${full_name_value}     Get Text    ${TXT_USER_COL_LOCATOR}${ROW_POSTION_USER_TO_VERIFY}/td[2]
    ${username_value}      Get Text    ${TXT_USER_COL_LOCATOR}${ROW_POSTION_USER_TO_VERIFY}/td[3]
    ${joined_date_value}   Get Text    ${TXT_USER_COL_LOCATOR}${ROW_POSTION_USER_TO_VERIFY}/td[4]
    ${user_type_value}     Get Text    ${TXT_USER_COL_LOCATOR}${ROW_POSTION_USER_TO_VERIFY}/td[5]
    Click On User Row To View User Detail Information
    Base Wait Until Element Is Visible  ${VERIFY_TYPE_LOCATOR}
    #Verify 
    Element Text Should Be       ${VERIFY_STAFF_CODE_LOCATOR}            ${staff_code_value}
    Element Text Should Be       ${VERIFY_FULL_NAME_LOCATOR}             ${full_name_value}
    Element Text Should Be       ${VERIFY_USER_NAME_LOCATOR}             ${username_value}
  #  Element Text Should Be      ${VERIFY_JOINED_DATE_LOCATOR}           ${joined_date_value}
    Element Text Should Be       ${VERIFY_TYPE_LOCATOR}                  ${user_type_value}
 
Click On User Row To View User Detail Information
    Base Click Element  ${TXT_USER_COL_LOCATOR}${ROW_POSTION_USER_TO_VERIFY}

#Create New User
*** Keywords ***
Click Create New User Button
    Base Click Element  ${BTN_CREATE_NEW_USER_LOCATOR} 

Fill In The New User Information
    [Arguments]        ${first_name}        ${last_name}        ${gender}        ${type}    ${dob_day}      ${dob_month}     ${dob_year}            ${jd_day}         ${jd_month}           ${jd_year}
    Wait Until Element Is Visible           ${DDL_TYPE_LOCATOR} 
    Base Input Text                         ${TXT_FIRST_NAME_LOCATOR}               ${first_name}
    Base Input Text                         ${TXT_LAST_NAME_LOCATOR}                ${last_name}
    Base Input Text                         ${DTP_DOB_LOCATOR}                      ${dob_month}/${dob_day}/${dob_year}
    Base Input Text                         ${DTP_JD_LOCATOR}                       ${jd_month}/${jd_day}/${jd_year}
    Press Keys                              None                                    ESC
    Press Keys                              None                                    ESC
    Base Click Element                      ${DDL_TYPE_LOCATOR}         
    Base Click Element                      xpath = //label[text()="Type"]/following-sibling::div//option[text()="${type}"]           
    Base Click Element                      xpath = //label[text()="${gender}"]
    Click Save Button To Create

Click Save Button To Create
    Base Click Element                       ${BTN_CREATE_USER_SAVE_LOCATOR}

Verify New User Create
    [Arguments]     ${first_name}        ${last_name}        ${gender}        ${type}    ${dob_day}      ${dob_month}     ${dob_year}            ${jd_day}         ${jd_month}           ${jd_year}
    Base Wait Until Element Is Visible  ${BTN_CREATE_NEW_USER_LOCATOR}
    Click On User Row To View User Detail Information
    Base Wait Until Element Is Visible  ${VERIFY_TYPE_LOCATOR}
    #Verify 
    Element Should Contain      ${VERIFY_FULL_NAME_LOCATOR}             ${first_name}${SPACE}${last_name}
   # Element Should Contain     ${VERIFY_DOB_LOCATOR}                   ${dob_month}/${dob_day}/${dob_year}
    Element Should Contain      ${VERIFY_GENDER_LOCATOR}                ${gender}
   # Element Should Contain     ${VERIFY_JOINED_DATE_LOCATOR}           ${jd_month}/${jd_day}/${jd_year}
    Element Should Contain      ${VERIFY_TYPE_LOCATOR}                  ${type.upper()}

#Disable User
*** Keywords ***
Click Disable User Button 
    [Arguments]        ${disable_confirm_message} 
    Wait For User List To Load Successfully
    ${staff_code_value}             Get Text    ${TXT_USER_COL_LOCATOR}${ROW_POSTION_USER_TO_DISABLE}/td[1]
    Base Click Element              ${TXT_USER_COL_LOCATOR}${ROW_POSTION_USER_TO_DISABLE}/td[@class="d-flex"]/div[2]
    Verify Disable Message          ${disable_confirm_message}
    Click Confirm Disable Button
    Reload Page
    Base Wait Until Element Is Visible  ${TXT_USER_COL_LOCATOR}${ROW_POSTION_USER_TO_DISABLE}/td[1]
    Element Text Should Not Be          ${TXT_USER_COL_LOCATOR}${ROW_POSTION_USER_TO_DISABLE}/td[1]     ${staff_code_value}

Verify Disable Message
    [Arguments]        ${disable_confirm_message} 
    Base Wait Until Element Is Visible      ${TXT_DISABLE_CONFIRM_MESSAGE_LOCATOR}
    Element Text Should Be                  ${TXT_DISABLE_CONFIRM_MESSAGE_LOCATOR}    ${disable_confirm_message}

Click Confirm Disable Button
    Base Click Element                      ${BTN_DISABLE_CONFIRM_LOCATOR} 
    
#Edit User
*** Keywords ***
Click Edit User Button 
    Base Click Element              ${TXT_USER_COL_LOCATOR}${ROW_POSTION_USER_TO_EDIT}/td[@class="d-flex"]/div[1]

Edit User Text Fields  
    [Arguments]             ${edit_gender}      ${edit_type}    ${edit_dob_day}    ${edit_dob_month}   ${edit_dob_year}    ${edit_jd_day}      ${edit_jd_month}     ${edit_jd_year}
    Base Wait Until Element Is Visible      ${BTN_EDIT_SAVE_LOCATOR}
    Wait Edit Page Load Successfully
    Press Keys                              ${DTP_DOB_EDIT_LOCATOR}                     CTRL+a+BACKSPACE
    Base Click Element                      ${DTP_DOB_EDIT_LOCATOR}          
    Base Input Text                         ${DTP_DOB_EDIT_LOCATOR}                     ${edit_dob_month}/${edit_dob_day}/${edit_dob_year}
    Press Keys                              None                                        ESC
    Press Keys                              ${DTP_JOINED_DATE_EDIT_LOCATOR}             CTRL+a+BACKSPACE
    Base Click Element                      ${DTP_JOINED_DATE_EDIT_LOCATOR}   
    Base Input Text                         ${DTP_JOINED_DATE_EDIT_LOCATOR}             ${edit_jd_month}/${edit_jd_day}/${edit_jd_year}
    Press Keys                              None                                        ESC
    Base Click Element                      ${DDL_TYPE_EDIT_LOCATOR}         
    Base Click Element                      ${DDL_TYPE_EDIT_LOCATOR}//option[text()="${edit_type}"]
    Base Click Element                      ${ROB_GENDER_EDIT_LOCATOR}//input[@value="${edit_gender}"]
    Click Edit Save Button

Wait Edit Page Load Successfully
    Wait Until Element Contains             ${DDL_TYPE_EDIT_LOCATOR}//option[@value="ADMIN"]     Admin

Click Edit Save Button
    Base Click Element                      ${BTN_EDIT_SAVE_LOCATOR}

Verify Edit User Detail
    [Arguments]     ${edit_gender}	${edit_type}	${edit_dob_day}	    ${edit_dob_month}	${edit_dob_year}	${edit_jd_day}	${edit_jd_month}	${edit_jd_year}
    Base Wait Until Element Is Visible  ${BTN_CREATE_NEW_USER_LOCATOR}
    Click On User Row To View User Detail Information
    Base Wait Until Element Is Visible  ${VERIFY_TYPE_LOCATOR}
    #Verify 
    Element Should Contain      ${VERIFY_DOB_LOCATOR}                   ${edit_dob_day}/${edit_dob_month}/${edit_dob_year}
    Element Should Contain      ${VERIFY_GENDER_LOCATOR}                ${edit_gender}
   #Element Should Contain      ${VERIFY_JOINED_DATE_LOCATOR}           ${edit_jd_day}/${edit_jd_month}/${edit_jd_year}
    Element Should Contain      ${VERIFY_TYPE_LOCATOR}                  ${edit_type.upper()}
    