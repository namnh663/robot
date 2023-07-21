*** Settings ***
Documentation       Login Page Object.

Library             SeleniumLibrary
Library             String
Variables           ../elements/login_elements.py
Variables           ../data/users.py
Variables           ../data/messages.py


*** Keywords ***
Open Browser To Login Page
    Open Browser    ${LOGIN_URL}    ${BROWSER}

Open Browser To
    [Arguments]    ${url}
    Open Browser    ${url}    ${BROWSER}

Input Username
    [Arguments]    ${username}
    Input Text    ${USERNAME_TXT}    ${username}

Input Random Username
    ${username} =    Generate Random String    ${8}
    Input Text    ${USERNAME_TXT}    ${username}

Input Random Password
    ${password} =    Generate Random String    ${10}
    Input Text    ${PASSWORD_TXT}    ${password}

Input Password
    [Arguments]    ${password}
    Input Text    ${PASSWORD_TXT}    ${password}

Submit Credentials
    Click Button    ${LOGIN_BTN}

Error Message Should Be
    [Arguments]    ${productspagetitle}
    Element Text Should Be    ${ERROR_MSG}    ${productspagetitle}

Valid Login
    [Arguments]    ${username}    ${password}
    Open Browser    ${LOGIN_URL}    ${BROWSER}
    Input Text    ${USERNAME_TXT}    ${username}
    Input Text    ${PASSWORD_TXT}    ${password}
    Click Button    ${LOGIN_BTN}
