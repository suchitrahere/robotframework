*** Settings ***
Documentation     Simple example using SeleniumLibrary.
Library           SeleniumLibrary

*** Variables ***
${LOGIN URL}      https://twitter.com/
${BROWSER}        Chrome
${signinbutton}     xpath=//a[@href = "/login"]
${Acceptallcookies}     xpath=//span[contains(@class,'css-901oao css-16my406 r-poiln3 r-bcqeeo r-qvutc0')]
*** Test Cases ***
Valid Login
    Open Browser To Login Page
    Input Username    junesuchi@gmail.com
    Input Password    Germany@2022
    Submit Credentials
    
    

*** Keywords ***
Open Browser To Login Page
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Title Should Be    Twitter
    Maximize Browser Window
    Click Element   ${signinbutton}
    Click Button    ${Acceptallcookies}
    

Input Username
    [Arguments]    ${username}
    Input Text    username_field    ${username}

Input Password
    [Arguments]    ${password}
    Input Text    password_field    ${password}

Submit Credentials
    Click Button    login_button

Welcome Page Should Be Open
    Title Should Be    Welcome Page