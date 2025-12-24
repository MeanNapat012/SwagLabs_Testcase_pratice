*** Settings ***
Library    SeleniumLibrary
Resource    CommonKeywords.robot

*** Keywords ***
Swag Labs should display home page and display message as "${expected_message}"
    CommonKeywords.Wait until page contains element then velify text    ${expected_message}

user logout from Swag Labs platform
    CommonKeywords.Wait until element is ready then click element    xpath=//button[@id="react-burger-menu-btn"]
    CommonKeywords.Wait until element is ready then click element    xpath=//a[@id="logout_sidebar_link"]