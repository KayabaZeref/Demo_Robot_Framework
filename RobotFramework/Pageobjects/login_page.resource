*** Settings ***
Library             SeleniumLibrary
Library             String
Library             DataDriver            file=../Data/user_login.xlsx            sheet_name = change_password
Resource            ../conf/conf_env.resource
Resource            base_page.resource

*** Variables ***
${TXT_USERNAME_LOCATOR}                 CSS   =   input[name="userName"]
${TXT_PASSWORD_LOCATOR}                 CSS   =   input[name="password"]
${BTN_LOGIN_LOCATOR}                    id:btn-login
${DDL_PROFILE_LOCATOR}                  CSS   =   a[class="btn btn-link dropdownButton"]>span
${BTN_LOGOUT_LOCATOR}                   xpath =  //a[text()="Logout"]
#${TXT_CURRENT_USERNAME_DATA}            Thee
#${TXT_CURRENT_PASSWORD_DATA}            123456
${TXT_CURRENT_USERNAME_DATA}            quynhpt
#${TXT_CURRENT_PASSWORD_DATA}            123456789
${TXT_CURRENT_PASSWORD_DATA}            Quynh@123

#Change Password
${BTN_CHANGE_PASSWORD_LOCATOR}          xpath =  //a[text()="Change Password"] 
${BTN_VIEW_CURRENT_PASSWORD_LOCATOR}    xpath = //div[@id="textbox"][1]//*[local-name() = 'svg']
${BTN_VIEW_NEW_PASSWORD_LOCATOR}        xpath = //div[@id="textbox"][2]//*[local-name() = 'svg']
${TXT_OLD_PASSWORD_LOCATOR}             xpath = //input[@name="currentPassword"] 
${TXT_NEW_PASSWORD_LOCATOR}             xpath = //input[@name="newPassword"]
#${TXT_NEW_PASSWORD_DATA}                Quynh@123
${TXT_NEW_PASSWORD_DATA}                123456789
${BTN_SAVE_NEW_PASSWORD_LOCATOR}        CSS   = button[type="submit"]
${BTN_CANCEL_NEW_PASSWORD_LOCATOR}      xpath = //button[text()="Cancel"]
${BTN_CONFIRM_CHANGE_PASSWORD_LOCATOR}  xpath = //button[@type="button" and text()="Close"]
${TXT_CONFIRM_CHANGE_PASSWORD_LOCATOR}  xpath =//div[@class="modal-body"]/p

*** Keywords ***
Login Into Home Page
    Base Open Browser 
    Base Navigate To Url         ${URL}
    Log Into Application         ${TXT_CURRENT_USERNAME_DATA}   ${TXT_CURRENT_PASSWORD_DATA} 

Log Into Application
    [Arguments]     ${username}     ${password}
    Input Username      ${username}
    Input Password      ${password}
    Click Login Button
    Check Logout Button Appear Successfully

Input Username
    [Arguments]         ${username}
    Base Input Text     ${TXT_USERNAME_LOCATOR}        ${username}

Input Password
    [Arguments]         ${password}
    Base Input Text     ${TXT_PASSWORD_LOCATOR}     ${password}

Click Login Button
    Base Click Element       ${BTN_LOGIN_LOCATOR}

Check Logout Button Appear Successfully
    Base Wait Until Element Is Visible       ${DDL_PROFILE_LOCATOR} 
    Base Click Element                       ${DDL_PROFILE_LOCATOR} 
    Base Wait Until Element Is Visible       ${BTN_LOGOUT_LOCATOR}

#Change Password
*** Keywords *** 
Change New Password Diffirent From Old Password
    Choose Change Password Dropdown Menu
    Input New Password
    Enable Password Text Appear
    
Choose Change Password Dropdown Menu
    Base Click Element          ${BTN_CHANGE_PASSWORD_LOCATOR}
    
Input New Password
    Base Input Text  ${TXT_OLD_PASSWORD_LOCATOR}  ${TXT_CURRENT_PASSWORD_DATA}
    Base Input Text  ${TXT_NEW_PASSWORD_LOCATOR}  ${TXT_NEW_PASSWORD_DATA}

Enable Password Text Appear
    Base Click Element  ${BTN_VIEW_CURRENT_PASSWORD_LOCATOR}
    Base Click Element  ${BTN_VIEW_NEW_PASSWORD_LOCATOR}
  
Click Save New Password Button
    Base Click Element  ${BTN_SAVE_NEW_PASSWORD_LOCATOR}

Confirm Change Password Message
    [Arguments]         ${change_password_confirm_msg}
    Base Wait Until Element Is Clickable  ${BTN_CONFIRM_CHANGE_PASSWORD_LOCATOR}
    Element Text Should Be      ${TXT_CONFIRM_CHANGE_PASSWORD_LOCATOR}           ${change_password_confirm_msg}


Login Again To Confirm Change Password Successfully
    Base Navigate To Url         ${URL}
    Input Username      ${TXT_CURRENT_USERNAME_DATA}          
    Input Password      ${TXT_NEW_PASSWORD_DATA}               
    Click Login Button
    Check Logout Button Appear Successfully
