*** Settings ***
Library  SeleniumLibrary
Library    RequestsLibrary
Library    JSONLibrary
Library    Collections
Library    requests


*** Variables ***
${baseurl}      https://fakestoreapi.com
${username}     admin
${password}    password
${body}
${prod1}

*** Test Cases ***
Test_products

    # Verify if all products with Key name as ID are displayed in response
    Create Session    mysession    ${baseurl}
    ${response} =  GET On Session    mysession   ${baseurl}/products
    
    # Validations
    # Verify if response code is 200
    ${statuscode} =    Convert To String    ${response.status_code}
    Should Be Equal    ${statuscode}    200

    #Verify if id field is seen in response
    Log    ${response.content}
    ${body}     Set Variable   ${response.content}
    Log    ${body}
    ${prod1} =    Convert String To Json   ${response.content}
    Log    ${prod1[0]}

    ${idkey} =     Get From Dictionary    ${prod1[0]}    id
    Log    ${idkey}
   

     
