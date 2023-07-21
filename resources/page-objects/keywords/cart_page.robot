*** Settings ***
Documentation       Products Page Object.

Library             SeleniumLibrary
Library             String
Library             Collections
Library             ../resources//utils/custom_keywords.py
Variables           ../elements/cart_elements.py


*** Keywords ***
Checkout
    Click Button    ${CHECKOUT_BTN}

Click Continue
    Click Button    ${CONTINUE_BTN}

Click Finish
    Click Button    ${FINISH_BTN}

Get Product Name List In Cart
    ${countitemsonpage} =    Get Element Count    ${CART_ITEMS_NUM}
    @{indexlist} =    Create Index Special List    ${countitemsonpage}
    ${beforelist} =    Create List
    FOR    ${item}    IN    @{indexlist}
        ${itemname} =    Get Text
        ...    //*[@class='cart_list']/div[${item}]/div[@class='cart_item_label']/a/div
        Append To List    ${beforelist}    ${itemname}
    END
    RETURN    ${beforelist}

Input Random First Name
    ${firstname} =    Generate Random String    ${5}
    Input Text    ${FIRST_NAME_TXT}    ${firstname}

Input Random Last Name
    ${lastname} =    Generate Random String    ${15}
    Input Text    ${LAST_NAME_TXT}    ${lastname}

Input Random Postal Code
    ${postal} =    Generate Random String    ${6}    [NUMBERS]
    Input Text    ${POSTAL_CODE_TXT}    ${postal}

Success Message Should Be
    [Arguments]    ${message}
    Element Text Should Be    ${THANK_YOU_H2}    ${message}

Quantity Of The Items In Cart Should Be
    [Arguments]    ${cartitems}
    ${countitems} =    Get Element Count    ${CART_ITEMS_NUM}
    Should Be True    ${countitems} == ${cartitems}

Items Added Should Be The Same as Items In Cart
    [Arguments]    ${cartitemslist}    ${addeditemlist}
    Lists Should Be Equal    ${cartitemslist}    ${addeditemlist}
