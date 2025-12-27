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
    Then Check "Sauce Labs Backpack" button text should be "Remove"
    Then Check "Sauce Labs Onesie" button text should be "Remove"
    Then Check "Sauce Labs Fleece Jacket" button text should be "Remove"
    Then Check cart badge count "3"
    [Teardown]    Remove all products from cart