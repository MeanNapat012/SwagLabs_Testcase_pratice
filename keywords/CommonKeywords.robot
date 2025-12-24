*** Settings ***
Library    SeleniumLibrary
Variables    ../resources/config/config.yaml

*** Keywords ***
Wait until element is ready then click element
    [Arguments]    ${locator}
    Wait until Keyword Succeeds    5x    2s    Click Element    ${locator}

Wait until element is ready then input text
    [Arguments]    ${locator}    ${text}
    Wait until Keyword Succeeds    5x    2s    Input Text    ${locator}    ${text}


Wait until page contains element then verify text
    [Arguments]    ${expected_text}
    Wait until Keyword Succeeds    5x    2s    Page Should Contain    ${expected_text}

Open Chrome Browser
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys

    ${arg1}=    Set Variable    --disable-features=PasswordManager,PasswordCheck
    ${arg2}=    Set Variable    --disable-blink-features=AutomationControlled

    Call Method    ${options}    add_argument    --start-maximized
    Call Method    ${options}    add_argument    --disable-notifications
    Call Method    ${options}    add_argument    --disable-infobars
    Call Method    ${options}    add_argument    --disable-save-password-bubble
    Call Method    ${options}    add_argument    ${arg1}
    Call Method    ${options}    add_argument    ${arg2}
    Call Method    ${options}    add_argument    --incognito

    &{prefs}=    Create Dictionary
    ...    credentials_enable_service=${False}
    ...    profile.password_manager_enabled=${False}
    ...    profile.password_manager_leak_detection=${False}

    Call Method    ${options}    add_experimental_option    prefs    ${prefs}

    Open Browser    ${baseUrl}    chrome    options=${options}

