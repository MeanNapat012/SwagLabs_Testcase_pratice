*** Settings ***
Library    SeleniumLibrary
Resource    ../keywords/CommonKeywords.robot
Resource    ../keywords/HomepageKeywords.robot
Resource    ../keywords/LoginPageKeywords.robot
Resource    ../keywords/InventoryKeywords.robot
Resource    ../keywords/Checkout_InformationKeywords.robot
Variables    ../resources/testdata/testdata.yaml
Suite Setup    Open Chrome Browser
Suite Teardown    Close Browser

*** Test cases ***
As a user, I want to checkout success with firstname, lastname and postalcode
    When user login to Swag labs platform with ${username} and ${valid_password}
    Then Add Product to cart "Sauce Labs Backpack"
    Then Check "Sauce Labs Backpack" button text should be "Remove"
    Then Check cart badge count "1"
    Then user go to cart inventory page
    Then Check product in cart "Sauce Labs Backpack"
    Then user go to checkout information
    Then user checkout with ${firstname}, ${lastname} and ${postalcode}
    Then Swag labs checkout overview should be display include "Sauce Labs Backpack" in cart, Payment information, Shipping information, and Price total
    [Teardown]    Swag Labs cancel checkout go to product page

As a user, I fail checkout with fistname, empty lastname, postalcode
    When user go to cart inventory page
    Then user go to checkout information
    Then user checkout with ${firstname}, empty lastname and ${postalcode}
    Then Swag labs checkout information should display validate information fail message as "Error: Last Name is required"
    [Teardown]    Swag Labs clear data firstname, lastname and zipcode

As a user, I fail checkout with firstname, lastname, empty postalcode
    When user checkout with ${firstname}, ${lastname} and empty zipcode
    Then Swag labs checkout information should display validate information fail message as "Error: Postal Code is required"
    [Teardown]    Swag Labs clear data firstname, lastname and zipcode

As a user, I fail checkout with empty firstname, lastname, postalcode
    When user checkout with empty firstname, ${lastname} and ${postalcode}
    Then Swag labs checkout information should display validate information fail message as "Error: First Name is required"
    [Teardown]    Swag Labs clear data firstname, lastname and zipcode

As a user, I fail checkout with firstname, empty lastname and empty postalcode
    When user checkout with ${firstname}, empty lastname and empty zipcode
    Then Swag labs checkout information should display validate information fail message as "Error: Last Name is required"
    [Teardown]    Swag Labs clear data firstname, lastname and zipcode

As a user, I fail checkout with empty firstname, lastname and empty postalcode
    When user checkout with empty firstname, ${lastname} and empty zipcode
    Then Swag labs checkout information should display validate information fail message as "Error: First Name is required"
    [Teardown]    Swag Labs clear data firstname, lastname and zipcode

As a user, I fail checkout with empty firstname, empty lastname and postalcode
    When user checkout with empty firstname, empty lastname and ${postalcode}
    Then Swag labs checkout information should display validate information fail message as "Error: First Name is required"
    [Teardown]    Swag Labs clear data firstname, lastname and zipcode

As a user, I checkout complete
    When user checkout with ${firstname}, ${lastname} and ${postalcode}
    Then Swag labs checkout overview should be display include "Sauce Labs Backpack" in cart, Payment information, Shipping information, and Price total
    Then Swag labs go to checkout complete
    Then Swag labs checkout Complete should display message as "Thank you for your order"
    sleep    2s

    
    

