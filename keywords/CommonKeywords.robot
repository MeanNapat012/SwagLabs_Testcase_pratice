*** Setting ***
Library    SeleniumLibrary
Variables    ../resources/config/config.yaml

*** Keywords ***
Wait until element is ready then click element
    [Argument]    ${locator}
    Wait until Keyword Succeeds    5x    2s    Click Element    ${locator}

Wait until element is ready then input text
    [Argument]    ${locator}    ${text}
    Wait until Keyword Succeeds    5x    2s    Input Text    ${locator}    ${text}

Wait until page contains element then velify text
    [Argument]    ${expected_text}
    Wait until Keyword Succeeds    5x    2s    Page Should Contain    ${expected_text}

Open Chrome Browser
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    Call Method    ${options}    add_argument    --start-maxmized
    Open Browser    ${baseUrl}    chrome    options=${options}