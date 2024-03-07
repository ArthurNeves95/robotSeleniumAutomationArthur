*** Settings ***
Documentation    Product Page elements and Keywords
Library    SeleniumLibrary
Library    Dialogs

*** Variables ***
${searchBar}                id:search_product
${submitSearchBtn}        id:submit_search
${firstProduct}           xpath://div[@class='productinfo text-center']/p
${addToCart}              xpath://div[@class='productinfo text-center']//a[@data-product-id]
${addToCartHover}         xpath://div[@class='overlay-content']//a[@data-product-id]
${dismissAdvertisement}    xpath://html/body/ins[2]/div[1]//ins/span/svg/path
${btnDismissModal}         xpath://button[@data-dismiss='modal']
${subscribeEmail}          id:susbscribe_email

*** Keywords ***
Verify if search bar is visible
    Element Should Be Visible    ${searchBar}

Search Item    [Arguments]    ${productName}
    Input Text    ${searchBar}   ${productName}
    Click Button     ${submitSearchBtn}
    Verify if product is visible    ${productName}

Verify if product is visible   [Arguments]    ${productName}
    ${prodIsVisible}=    Run Keyword And Return Status    Element Should Be Visible    ${firstProduct}
    Run Keyword If    ${prodIsVisible}        Element Should Contain    ${firstProduct}       ${productName}
    
Add items to cart    [Arguments]    @{Products}
    FOR    ${item}    IN    @{Products}
        Search Item    ${item}
        Add to cart    ${item}
    END

Add to cart   [Arguments]    ${productName}
    Scroll Element Into View    ${subscribeEmail}
    Wait Until Element Is Visible    ${addToCart}
    Mouse Over    ${addToCart}
    Wait Until Element Is Visible    ${addToCartHover}
    Click Element    ${addToCartHover}
    Dismiss add to cart alert

Dismiss add to cart alert
    Wait Until Element Is Visible    ${btnDismissModal}
    Click Button    ${btnDismissModal}

Dismiss Advertisement
    Wait Until Element Is Visible    ${dismissAdvertisement}
    Click Button    ${dismissAdvertisement}
    
