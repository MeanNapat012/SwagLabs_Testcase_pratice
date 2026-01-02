*** Settings ***
Library    SeleniumLibrary
Resource    CommonKeywords.robot
Resource    ProductKeywords.robot

*** Keywords ***
Swag Labs should display home page and display message as "${expected_message}"
    CommonKeywords.Wait until page contains element then verify text    ${expected_message}

user logout from Swag Labs platform
    CommonKeywords.Wait until element is ready then click element    xpath=//button[@id="react-burger-menu-btn"]
    Wait Until Element Is Visible    id=logout_sidebar_link    5s
    Click Element    id=logout_sidebar_link


Add Product to cart "${product_name}"
    ProductKeywords.Add Product to cart by name    ${product_name}

Add three Product to cart "${product_name_01}", "${product_name_02}" and "${product_name_03}"
    ProductKeywords.Add Product to cart by name    ${product_name_01}
    ProductKeywords.Add Product to cart by name    ${product_name_02}
    ProductKeywords.Add Product to cart by name    ${product_name_03}

Remove Product to cart "${product_name}" by remove button
    ProductKeywords.Remove Product from cart by name on Product page   ${product_name}

Remove three Product to cart "${product_name_01}", "${product_name_02}" and "${product_name_03}"
    ProductKeywords.Remove Product from cart by name on Product page    ${product_name_01}
    ProductKeywords.Remove Product from cart by name on Product page    ${product_name_02}
    ProductKeywords.Remove Product from cart by name on Product page    ${product_name_03}

Check "${product_name}" button text should be "${expected_text}"
    ProductKeywords.Product button text should be    ${product_name}    ${expected_text}

Check three product "${product_name_01}", "${product_name_02}" and "${product_name_03}" button text should be "${expected_text}"
    ProductKeywords.Product button text should be    ${product_name_01}    ${expected_text}
    ProductKeywords.Product button text should be    ${product_name_02}    ${expected_text}
    ProductKeywords.Product button text should be    ${product_name_03}    ${expected_text}


Check Cart badge count "${expected_count}"
    ProductKeywords.Cart badge should be    ${expected_count}

Check cart badge should not be visible
    Page Should Not Contain Element    class=shopping_cart_badge

Check Product detail page should be display "${product_name}"
    ProductKeywords.Product detail page should be display    ${product_name}

user go to Product detail "${product_name}"
    ProductKeywords.Click to Product detail    ${product_name}

user go back to Product page
    CommonKeywords.Wait until element is ready then click element    xpath=//button[text()="Back to products"]

user click "${expected_text}" button on Product detail
    ProductKeywords.Click Product Button on Product detail    ${expected_text}

Check button text should be "${expected_text}"
    ProductKeywords.Check Product button text should be on Product detail    ${expected_text}

Remove all products from cart
    ${remove_buttons}=    Get WebElements    xpath=//button[text()="Remove"]
    FOR    ${btn}    IN    @{remove_buttons}
        Click Element    ${btn}
    END

Cleanup cart and return to product page
    Run Keyword And Ignore Error    user go back to Product page
    Run Keyword And Ignore Error    Remove all products from cart

