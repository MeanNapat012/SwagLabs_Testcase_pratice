*** Settings ***
Library    SeleniumLibrary
Resource    CommonKeywords.robot
Resource    ProductKeywords.robot

*** Keywords ***
user go to checkout information
    CommonKeywords.Wait until element is ready then click element    xpath=//button[@id="checkout"]

user checkout with ${firstname}, ${lastname} and ${zipcode}
    CommonKeywords.Wait until element is ready then input text    name=firstName    ${firstname}
    CommonKeywords.Wait until element is ready then input text    name=lastName     ${lastname}
    CommonKeywords.Wait until element is ready then input text    name=postalCode   ${zipcode}
    CommonKeywords.Wait until element is ready then click element    xpath=//input[@id="continue"]

user checkout with empty firstname, ${lastname} and ${zipcode}
    CommonKeywords.Wait until element is ready then input text    name=lastName     ${lastname}
    CommonKeywords.Wait until element is ready then input text    name=postalCode   ${zipcode}
    CommonKeywords.Wait until element is ready then click element    xpath=//input[@id="continue"]

user checkout with ${firstname}, empty lastname and ${zipcode}
    CommonKeywords.Wait until element is ready then input text    name=firstName    ${firstname}
    CommonKeywords.Wait until element is ready then input text    name=postalCode   ${zipcode}
    CommonKeywords.Wait until element is ready then click element    xpath=//input[@id="continue"]

user checkout with ${firstname}, ${lastname} and empty zipcode
    CommonKeywords.Wait until element is ready then input text    name=firstName    ${firstname}
    CommonKeywords.Wait until element is ready then input text    name=lastName     ${lastname}
    CommonKeywords.Wait until element is ready then click element    xpath=//input[@id="continue"]

user checkout with ${firstname}, empty lastname and empty zipcode
    CommonKeywords.Wait until element is ready then input text    name=firstName    ${firstname}
    CommonKeywords.Wait until element is ready then click element    xpath=//input[@id="continue"]

user checkout with empty firstname, ${lastname} and empty zipcode
    CommonKeywords.Wait until element is ready then input text    name=lastName     ${lastname}
    CommonKeywords.Wait until element is ready then click element    xpath=//input[@id="continue"]

user checkout with empty firstname, empty lastname and ${zipcode}
    CommonKeywords.Wait until element is ready then input text    name=postalCode   ${zipcode}
    CommonKeywords.Wait until element is ready then click element    xpath=//input[@id="continue"]

Swag labs checkout information should display validate information fail message as "${expected_message}"
    CommonKeywords.Wait until page contains element then verify text    ${expected_message}

Swag labs checkout Complete should display message as "${expected_message}"
    CommonKeywords.Wait until page contains element then verify text    ${expected_message}

Swag labs checkout overview should be display include "${product_name}" in cart, Payment information, Shipping information, and Price total
    CommonKeywords.Wait until page contains element then verify text    ${product_name}
    CommonKeywords.Wait until page contains element then verify text    Payment Information
    CommonKeywords.Wait until page contains element then verify text    Shipping Information
    CommonKeywords.Wait until page contains element then verify text    Price Total

Swag Labs clear data firstname, lastname and zipcode
    Press Keys    id=first-name    CTRL+A    BACKSPACE
    Press Keys    id=last-name     CTRL+A    BACKSPACE
    Press Keys    id=postal-code    CTRL+A    BACKSPACE

Swag Labs cancel checkout go to product page
    CommonKeywords.Wait until element is ready then click element    xpath=//button[@id="cancel"]

Swag Labs go to checkout complete
    CommonKeywords.Wait until element is ready then click element    xpath=//button[@id="finish"]



    


