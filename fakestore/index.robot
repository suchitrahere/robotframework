*** Settings ***
Documentation  Login Functionality
Library  SeleniumLibrary
Library    RequestsLibrary
Library    JSONLibrary
Library    Collections

*** Variables ***
${baseurl}      https://fakestoreapi.com
${username}     admin
${password}    password
${status_code}
${body}
${id}

*** Test Cases ***
Login_to_get_authtoken_and_clientID

    Create Session    mysession    ${baseurl}
    ${response} =   GET On Session   ${baseurl} /auth/login/${username}/${password}
    # Log To Console    ${response.status_code}
    # Log to Console    ${response.content}
    # Log To Console    ${response.headers}

    # Validations
    ${status_code} = convert to string    ${response.status_code}
    Should Be Equal    ${status_code}     200

    ${body}= ${response.content}




