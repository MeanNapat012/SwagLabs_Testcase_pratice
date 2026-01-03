*** Settings ***
Library    SeleniumLibrary
Resource    CommonKeywords.robot
Resource    ProductKeywords.robot
Resource    CartpageKeywords.robot

*** Keywords ***
user go to cart inventory page
    CommonKeywords.Wait until element is ready then click element    xpath=//a[@class="shopping_cart_link"]

Cart page should be display include Your cart, Empty cart, Continue Shopping button and Checkout button
    CartpageKeywords.Cart should be empty
    CommonKeywords.Wait until page contains element then verify text    Your Cart
    CommonKeywords.Wait until page contains element then verify text    Continue Shopping
    CommonKeywords.Wait until page contains element then verify text    Checkout

Check product in cart "${product_name}"
    CommonKeywords.Wait until page contains element then verify text    ${product_name}

Check many product in cart "${product_name_01}", "${product_name_02}" and "${product_name_03}"
    CommonKeywords.Wait until page contains element then verify text    ${product_name_01}
    CommonKeywords.Wait until page contains element then verify text    ${product_name_02}
    CommonKeywords.Wait until page contains element then verify text    ${product_name_03}

user go back to product page from your cart
    CommonKeywords.Wait until element is ready then click element    xpath=//button[@id="continue-shopping"]

user remove product from cart "${product_name}"
    CartpageKeywords.Remove Product from cart by name on Your Cart    ${product_name}

user remove many product from cart "${product_name_01}", "${product_name_02}" and "${product_name_03}"
    CartpageKeywords.Remove Product from cart by name on Your Cart    ${product_name_01}
    CartpageKeywords.Remove Product from cart by name on Your Cart    ${product_name_02}
    CartpageKeywords.Remove Product from cart by name on Your Cart    ${product_name_03}

Cleanup all and return to product page from your cart    
    Run Keyword And Ignore Error    user go back to product page from your cart
    Run Keyword And Ignore Error    Remove all products from cart

