*** Test Cases ***
# Do something
#     Open Browser    https://opensource-demo.orangehrmlive.com/    Chrome
#     Wait Until Element Is Visible  id:txtUsername  timeout=5
#     Input Text  id:txtUsername  Admin
#     Input Password  id:txtPassword  admin123
#     Click Element  id:btnLogin
#     Element Should Be Visible  id:welcome  timeout=5
#     Close Browser
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