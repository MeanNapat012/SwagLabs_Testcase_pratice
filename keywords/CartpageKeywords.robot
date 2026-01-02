*** Settings ***
library    SeleniumLibrary
Resource    CommonKeywords.robot

*** Keywords ***
Cart should be empty
    Page Should Not Contain Element    css=.cart_item

Remove Product from cart by name on Your Cart
    [Arguments]    ${product_name}
    ${remove_btn}=    Set Variable
    ...    xpath=//div[@class="cart_item" and .//div[text()="${product_name}"]]//button[text()="Remove"]
    CommonKeywords.Wait until element is ready then click element    ${remove_btn}
