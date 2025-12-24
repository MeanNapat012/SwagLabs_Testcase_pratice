*** Settings ***
Library    SeleniumLibrary
Resource    CommonKeywords.robot

*** Keywords ***
Swag Labs should display home page and display message as "${expected_message}"
    CommonKeywords.Wait until page contains element then verify text    ${expected_message}

user logout from Swag Labs platform
    CommonKeywords.Wait until element is ready then click element    xpath=//button[@id="react-burger-menu-btn"]
    Wait Until Element Is Visible    id=logout_sidebar_link    5s
    Click Element    id=logout_sidebar_link