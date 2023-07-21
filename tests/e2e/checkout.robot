*** Settings ***
Resource        ../resources/page-objects/keywords/login_page.robot
Resource        ../resources/page-objects/keywords/products_page.robot
Resource        ../resources/page-objects/keywords/cart_page.robot

Test Setup      login_page.Valid Login    standard_user    secret_sauce

Name            Add Item Tests


*** Test Cases ***
Checkout
    [Tags]    functional
    products_page.Add Sauce Labs Backpack To Cart
    products_page.Add Sauce Labs Bike Light To Cart
    products_page.Quantity Of The Items In Cart Should Be    2
    products_page.View Cart
    cart_page.Checkout
    cart_page.Input Random First Name
    cart_page.Input Random Last Name
    cart_page.Input Random Postal Code
    cart_page.Click Continue
    cart_page.Click Finish
    cart_page.Success Message Should Be    Thank you for your order!
    [Teardown]    Close Browser
