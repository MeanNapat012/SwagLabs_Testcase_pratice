*** Settings ***
Library    SeleniumLibrary
Resource    CommonKeywords.robot

*** Keywords ***
Add Product to cart by name
    [Arguments]    ${product_name}
    ${add_btn}=    Set Variable
    ...    xpath=//div[text()="${product_name}"]/ancestor::div[@class="inventory_item"]//button[text()="Add to cart"]
    Wait Until Element Is Visible    ${add_btn}    10s
    Click Element    ${add_btn}

Remove Product from cart by name on Product page
    [Arguments]    ${product_name}  
    ${remove_btn}=    Set Variable
    ...    xpath=//div[text()="${product_name}"]/ancestor::div[@class="inventory_item"]//button[text()="Remove"]
    Wait Until Element Is Visible    ${remove_btn}
    Click Element    ${remove_btn}

Product button text should be
    [Arguments]    ${product_name}    ${expected_text}
    ${btn}=    Set Variable
    ...    xpath=//div[text()="${product_name}"]/ancestor::div[@class="inventory_item"]//button
    Wait Until Element Is Visible    ${btn}    10s
    Element Text Should Be           ${btn}    ${expected_text}

Cart badge should be 
    [Arguments]    ${expected_count}
    ${badge}=    Set Variable    css=.shopping_cart_badge
    Wait Until Element Is Visible    ${badge}    10s
    Element Text Should Be           ${badge}    ${expected_count}

Product detail page should be display
    [Arguments]    ${product_name}
    Wait Until Element Is Visible
    ...    xpath=//div[@data-test="inventory-item-name" and normalize-space(.)="${product_name}"]
    Page Should Contain Element    xpath=//button[text()="Back to products"]
    Page Should Contain Element    xpath=//button[text()="Add to cart" or text()="Remove"]


Click to Product detail
    [Arguments]    ${product_name}
    ${product}=    Set Variable
    ...    xpath=//div[@data-test="inventory-item-name" and normalize-space(.)="${product_name}"]
    Wait Until Page Contains Element    ${product}    10s
    Scroll Element Into View            ${product}
    Click Element                       ${product}

Click Product Button on Product detail
    [Arguments]    ${expected_text}
    ${add_btn}=    Set Variable
    ...    xpath=//button[text()="${expected_text}"]
    Wait Until Element Is Visible    ${add_btn}    10s
    Click Element    ${add_btn}

Check Product button text should be on Product detail
    [Arguments]    ${expected_text}
    ${btn}=    Set Variable
    ...    xpath=//button[@class="btn btn_primary btn_small btn_inventory" and text()="${expected_text}"]
