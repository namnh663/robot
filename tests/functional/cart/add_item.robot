*** Settings ***
Resource            ../resources/page-objects/keywords/login_page.robot
Resource            ../resources/page-objects/keywords/products_page.robot

Test Setup          login_page.Valid Login    ${USER_001}    ${PASSWORD_COMMON}
Test Teardown       Close Browser

Name                Add Item Tests


*** Test Cases ***
Add Single Item To Cart
    [Tags]    functional
    products_page.Add Sauce Labs Backpack To Cart
    products_page.Quantity Of The Items In Cart Should Be    1

Add Mutiple Item To Cart
    [Tags]    functional
    products_page.Add Sauce Labs Backpack To Cart
    products_page.Add Sauce Labs Bike Light To Cart
    products_page.Quantity Of The Items In Cart Should Be    2

Add All Item To Cart
    [Tags]    functional
    products_page.Add All Product To Cart
    products_page.Quantity Of The Items In Cart Should Be    6
