*** Settings ***
Resource        ../resources/page-objects/keywords/login_page.robot
Resource        ../resources/page-objects/keywords/products_page.robot
Resource        ../resources/page-objects/keywords/cart_page.robot

Test Setup      login_page.Valid Login    ${USER_001}    ${PASSWORD_COMMON}

Name            Display Tests


*** Test Cases ***
Display Items Number On A Page
    [Tags]    functional
    products_page.Items Number On A Page Should Be    6
    [Teardown]    Close Browser

ASC Sorted List By Name Default
    [Tags]    functional
    products_page.Products Sorted List By Name Should Be ASC
    [Teardown]    Close Browser

DESC Sorted List By Name
    [Tags]    functional
    products_page.Filter By    Name (Z to A)
    products_page.Products Sorted List By Name Should Be DESC
    [Teardown]    Close Browser

Display Items In Cart
    [Tags]    functional
    products_page.Add SLB And SLBL To Cart
    products_page.Quantity Of The Items In Cart Should Be    2
    ${itemsadded} =    products_page.Get Product Name List Added To The Cart
    products_page.View Cart
    cart_page.Quantity Of The Items In Cart Should Be    2
    ${itemsincart} =    cart_page.Get Product Name List In Cart
    cart_page.Items Added Should Be The Same as Items In Cart    ${itemsadded}    ${itemsincart}
    [Teardown]    Close Browser
