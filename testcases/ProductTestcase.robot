*** Settings ***
Library    SeleniumLibrary
Resource    ../keywords/CommonKeywords.robot
Resource    ../keywords/HomepageKeywords.robot
Resource    ../keywords/LoginPageKeywords.robot
Resource    ../keywords/ProductKeywords.robot
Variables    ../resources/testdata/testdata.yaml
Suite Setup    Open Chrome Browser
Suite Teardown    Close Browser

*** Test cases ***
As a user, I can add Product to cart
    When user login to Swag labs platform with ${username} and ${valid_password}
    Then Add Product to cart "Sauce Labs Backpack"
    Then Check "Sauce Labs Backpack" button text should be "Remove"
    Then Check cart badge count "1"
    [Teardown]    Remove all products from cart

As a user, I can add many Product to cart
    When Add three Product to cart "Sauce Labs Backpack", "Sauce Labs Onesie" and "Sauce Labs Fleece Jacket"
    Then Check three product "Sauce Labs Backpack", "Sauce Labs Onesie" and "Sauce Labs Fleece Jacket" button text should be "Remove"
    Then Check cart badge count "3"
    [Teardown]    Remove all products from cart

As a user, I can remove Product to cart on Product page
    When Add Product to cart "Sauce Labs Backpack"
    Then Check "Sauce Labs Backpack" button text should be "Remove"
    Then Check cart badge count "1"
    Then Remove Product to cart "Sauce Labs Backpack" by remove button
    Then Check "Sauce Labs Backpack" button text should be "Add to cart"
    Then Check cart badge should not be visible
    [Teardown]    Remove all products from cart

As a user, I can remove many Product to cart on Product page
    When Add three Product to cart "Sauce Labs Bolt T-Shirt", "Sauce Labs Bike Light" and "Sauce Labs Backpack"
    Then Check three product "Sauce Labs Bolt T-Shirt", "Sauce Labs Bike Light" and "Sauce Labs Backpack" button text should be "Remove"
    Then Check cart badge count "3"
    Then Remove three Product to cart "Sauce Labs Bolt T-Shirt", "Sauce Labs Bike Light" and "Sauce Labs Backpack"
    Then Check three product "Sauce Labs Bolt T-Shirt", "Sauce Labs Bike Light" and "Sauce Labs Backpack" button text should be "Add to cart"
    Then Check cart badge should not be visible
    [Teardown]    Remove all products from cart

As a user, I want to Product detail page
    When user go to Product detail "Sauce Labs Backpack"
    Then Check Product detail page should be display "Sauce Labs Backpack"
    [Teardown]    user go back to Product page

As a user, I want add Product on Product detail page
    When user go to Product detail "Sauce Labs Backpack"
    Then Check Product detail page should be display "Sauce Labs Backpack"
    Then user click "Add to cart" button on Product detail
    Then Check button text should be "Remove"
    Then Check cart badge count "1"
    [Teardown]    Cleanup cart and return to product page

As a user, I want remove Product detail page
    When user go to Product detail "Sauce Labs Bolt T-Shirt"
    Then Check Product detail page should be display "Sauce Labs Bolt T-Shirt"
    Then user click "Add to cart" button on Product detail
    Then Check button text should be "Remove"
    Then Check cart badge count "1"
    Then user click "Remove" button on Product detail
    Then Check cart badge should not be visible
    [Teardown]    Cleanup cart and return to product page