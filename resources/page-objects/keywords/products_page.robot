*** Settings ***
Documentation       Products Page Object.

Library             SeleniumLibrary
Library             Collections
Library             ../resources//utils/custom_keywords.py
Variables           ../elements/products_elements.py


*** Keywords ***
Add Sauce Labs Backpack To Cart
    Click Button    ${ADD_SLB_TO_CART_BTN}

Add Sauce Labs Bike Light To Cart
    Click Button    ${ADD_SLBL_TO_CART_BTN}

Add SLB And SLBL To Cart
    Add Sauce Labs Backpack To Cart
    Add Sauce Labs Bike Light To Cart

View Cart
    Click Element    ${CART_LINK}

Add All Product To Cart
    ${countitemsonpage} =    Get Element Count    ${ITEMS_ON_PAGE_NUM}
    @{indexlist} =    Create Index List    ${countitemsonpage}
    FOR    ${item}    IN    @{indexlist}
        Click Button
        ...    //div[@class='inventory_list']/div[${item}]/div[@class='inventory_item_description']/div[@class='pricebar']/button
    END

Get Product Name List Added To The Cart
    ${countitemsonpage} =    Get Element Count    ${ITEMS_ADDED_NUM}
    @{indexlist} =    Create Index List    ${countitemsonpage}
    ${beforelist} =    Create List
    FOR    ${item}    IN    @{indexlist}
        ${itemname} =    Get Text
        ...    //div[@class='inventory_list']/div[${item}]/div[@class='inventory_item_description']/div[@class='inventory_item_label']/a/div
        Append To List    ${beforelist}    ${itemname}
    END
    RETURN    ${beforelist}

Get Sorted List On UI
    ${countitemsonpage} =    Get Element Count    ${ITEMS_ON_PAGE_NUM}
    @{indexlist} =    Create Index List    ${countitemsonpage}
    ${beforelist} =    Create List
    FOR    ${item}    IN    @{indexlist}
        ${itemname} =    Get Text
        ...    //div[@class='inventory_list']/div[${item}]/div[@class='inventory_item_description']/div[@class='inventory_item_label']/a/div
        Append To List    ${beforelist}    ${itemname}
    END
    RETURN    ${beforelist}

Products Sorted List By Name Should Be ASC
    ${beforelist} =    Get Sorted List On UI
    ${afterlist} =    Create Ascending List    ${beforelist}
    Lists Should Be Equal    ${beforelist}    ${afterlist}

Products Sorted List By Name Should Be DESC
    ${beforelist} =    Get Sorted List On UI
    ${sortedlist} =    Create Ascending List    ${beforelist}
    ${afterlist} =    Create Descending List    ${sortedlist}
    Lists Should Be Equal    ${beforelist}    ${afterlist}

Filter By
    [Arguments]    ${option}
    Select From List By Label    ${ITEM_SORT}    ${option}

Products Page Should Be Open And Title Should Be
    [Arguments]    ${productspagetitle}
    Title Should Be    ${productspagetitle}

Quantity Of The Items In Cart Should Be
    [Arguments]    ${itemsnumberincart}
    Element Text Should Be    ${ITEMS_IN_CART_NUM}    ${itemsnumberincart}

Items Number On A Page Should Be
    [Arguments]    ${itemsnumberonpage}
    ${countitemsonpage} =    Get Element Count    ${ITEMS_ON_PAGE_NUM}
    Should Be True    ${countitemsonpage} == ${itemsnumberonpage}
