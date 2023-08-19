*** Settings ***
Library         RequestsLibrary
Library         JSONLibrary
Library         Collections


*** Variables ***
${URL}          https://reqres.in/api


*** Test Cases ***
Create request session
    create session   mysession   ${url}    verify=true

API GET
    ${response}   get on session    mysession   ${url}/users
    ${response}     set variable    ${response.json()}
    log to console      API GET response: ${response}

    dictionary should contain key   ${response}     page
    dictionary should contain key   ${response}     data

API POST
    ${name}     set variable    Juan Dela Cruz
    ${job}     set variable     QA Engineer

    ${body}  catenate
    ...    {
    ...       "name": "${name}",
    ...       "job": "${job}"
    ...    }
    ${body}    convert string to json  ${body}
    ${headers}   create dictionary     Content-Type=application/json
    ${response}   post on session    mysession   ${url}/users       json=${body}  headers=${headers}
    ${response}     set variable    ${response.json()}
    log to console      API POST response: ${response}

    should be equal     ${name}     ${response['name']}
    should be equal     ${job}     ${response['job']}
