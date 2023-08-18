*** Settings ***
Library             SeleniumLibrary



*** Variables ***
${URL}                      https://demo.nopcommerce.com/
${browser}                  chrome

${loginLinkLocator}         xpath=//a[@class='ico-login']
${emailInputBox}            id=Email
${passwordInputBox}         id=Password
${loginButton}              xpath=//button[@class='button-1 login-button']


*** Test Cases ***
Login using a valid username and a valid passsword
    open browser        ${URL}      ${browser}
    wait until element is visible       ${loginLinkLocator}
    click element   ${loginLinkLocator}
    wait until element is visible     ${emailInputBox}
    input text      ${emailInputBox}       abcd@gmail.com
    input text      ${passwordInputBox}     pasword123
    click button    ${loginButton}
    close browser
