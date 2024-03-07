*** Settings ***
Documentation    Landing Page elements and Keywords
Library    SeleniumLibrary

*** Variables ***
${landingPageURL}    https://automationexercise.com/
${productsBtn}    xpath://*[@id="header"]/div/div/div/div[2]/div/ul/li[2]/a
${cartBtn}    //*[@id="header"]/div/div/div/div[2]/div/ul/li[3]/a

*** Keywords ***
Start test cases
    Open Browser     ${landingPageURL}    chrome
    Maximize Browser Window
    Sleep    1s

Close test Cases
    Close All Browsers

Click products Page
    Click Element     ${productsBtn}

Click cart Page
    Click Element     ${cartBtn}

