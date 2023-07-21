*** Settings ***
Resource    ../resources/page-objects/keywords/login_page.robot
Resource    ../resources/page-objects/keywords/products_page.robot

Name        Access Link Tests


*** Test Cases ***
Access Link Without Login
    [Documentation]    Access Link Without Login
    [Tags]    functional
    login_page.Open Browser To    ${PRODUCTS_URL}
    login_page.Error Message Should Be    ${LOGIN_ERROR_MSG_005}
    [Teardown]    Close Browser
