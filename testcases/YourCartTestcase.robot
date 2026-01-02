*** Settings ***
Library    SeleniumLibrary
Resource    ../keywords/CommonKeywords.robot
Resource    ../keywords/HomepageKeywords.robot
Resource    ../keywords/LoginPageKeywords.robot
Resource    ../keywords/ProductKeywords.robot
Resource    ../keywords/InventoryKeywords.robot
Variables    ../resources/testdata/testdata.yaml
Suite Setup    Open Chrome Browser
Suite Teardown    Close Browser

*** Test cases **
As a user, I want go to Your cart page
    When user login to Swag labs platform with ${username} and ${valid_password}
    Then user go to cart inventory page
    Then Cart page should be display include Your cart, Empty cart, Continue Shopping button and Checkout button
    [Teardown]    Cleanup all and return to product page from your cart

As a user, I can check product on Your cart after Add product
    When Add Product to cart "Sauce Labs Backpack"
    Then Check "Sauce Labs Backpack" button text should be "Remove"
    Then Check cart badge count "1"
    Then user go to cart inventory page
    Then Check product in cart "Sauce Labs Backpack"
    [Teardown]    Cleanup all and return to product page from your cart 

As a user, I can check many product on Your cat after Add many product
    When Add three Product to cart "Sauce Labs Bolt T-Shirt", "Sauce Labs Bike Light" and "Sauce Labs Backpack"
    Then Check three product "Sauce Labs Bolt T-Shirt", "Sauce Labs Bike Light" and "Sauce Labs Backpack" button text should be "Remove"
    Then Check cart badge count "3"
    Then user go to cart inventory page
    Then Check many product in cart "Sauce Labs Bolt T-Shirt", "Sauce Labs Bike Light" and "Sauce Labs Backpack"
    [Teardown]    Cleanup all and return to product page from your cart

As a user, I go back to product page with continue shopping button
    When Add Product to cart "Sauce Labs Backpack"
    Then Check "Sauce Labs Backpack" button text should be "Remove"
    Then Check cart badge count "1"
    Then user go to cart inventory page
    Then user go back to product page from your cart
    [Teardown]    Remove all products from cart

As a user, I can remove product on Your cart
    When Add Product to cart "Sauce Labs Backpack"
    Then Check "Sauce Labs Backpack" button text should be "Remove"
    Then Check cart badge count "1"
    Then user go to cart inventory page
    Then user remove product from cart "Sauce Labs Backpack"
    Then Check cart badge should not be visible
    Then Cart should be empty
    [Teardown]    Cleanup all and return to product page from your cart

As a user, I can check many product on Your cat after Add many product
    When Add three Product to cart "Sauce Labs Bolt T-Shirt", "Sauce Labs Bike Light" and "Sauce Labs Backpack"
    Then Check three product "Sauce Labs Bolt T-Shirt", "Sauce Labs Bike Light" and "Sauce Labs Backpack" button text should be "Remove"
    Then Check cart badge count "3"
    Then user go to cart inventory page
    Then Check many product in cart "Sauce Labs Bolt T-Shirt", "Sauce Labs Bike Light" and "Sauce Labs Backpack"
    Then user remove many product from cart "Sauce Labs Bolt T-Shirt", "Sauce Labs Bike Light" and "Sauce Labs Backpack"
    Then Check cart badge should not be visible
    Then Cart should be empty
    [Teardown]    Cleanup all and return to product page from your cart
    