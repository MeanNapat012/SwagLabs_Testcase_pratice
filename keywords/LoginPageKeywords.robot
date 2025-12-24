*** Settings ***
Library    SeleniumLibrary
Resource    CommonKeywords.robot

*** Keywords ***
user login to Swag labs platform with ${username} and ${password}
    CommonKeywords.Wait until element is ready then input text    name=user-name    ${username}
    CommonKeywords.Wait until element is ready then input text   name=password    ${password}
    CommonKeywords.Wait until element is ready then click element    xpath=//input[@type="submit" and @id="login-button"]

user login to Swag labs platform empty username and ${password}
    CommonKeywords.Wait until element is ready then input text   name=password    ${password}
    CommonKeywords.Wait until element is ready then click element    xpath=//input[@type="submit" and @id="login-button"]

user login to Swag labs platform empty password and ${username}
    CommonKeywords.Wait until element is ready then input text    name=user-name    ${username}
    CommonKeywords.Wait until element is ready then click element    xpath=//input[@type="submit" and @id="login-button"]

Swag labs should display display validate login fail message as "${expected_message}"
    CommonKeywords.Wait until page contains element then verify text    ${expected_message}

Swag labs clear data username and password
    Wait Until Element Is Visible    id:user-name    10s
    Press Keys    id:user-name    CTRL+A    BACKSPACE
    Press Keys    id:password     CTRL+A    BACKSPACE