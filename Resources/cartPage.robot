*** Settings ***
Documentation    Cart Page elements and Keywords
Library    SeleniumLibrary
Library    Dialogs
Library    String

*** Variables ***
${productsList}                   id:cart_info_table
${itemPrePath}                    xpath=//tr[
${priceComplement}                ]//td[@class='cart_price']/p
${quantityItemComplement}         ]//td[@class='cart_quantity']/button
${totalPrice}                     xpath=//tr[
${totalPriceComplement}           ]//td[@class='cart_total']/p[@class='cart_total_price']
${productItem}                    ${1}
${productsTable}                  //*[@id="cart_info_table"]

*** Keywords ***
Verify item price    [Arguments]    @{Products}
    FOR    ${item}    IN    @{Products}
        Verify item price   ${item}
    END

Verify if added products to cart exists   [Arguments]    @{Products}
    FOR    ${item}    IN    @{Products}
    ${prodIsVisible}=    Run Keyword And Return Status    Element Should Be Visible    ${productsList}
    Run Keyword If    ${prodIsVisible}        Element Should Contain    ${productsList}       ${item}
    END
    

Verify products values   [Arguments]    @{Products}
    FOR    ${index}    IN    ${productsTable}
    ${priceTxt1}    Get Text    ${itemPrePath}${index}${priceComplement}
    ${price}    Remove String     ${priceTxt1}    Rs.
    ${quantity}    Get Text    ${itemPrePath}${index}${quantityItemComplement}
    ${expected_total}    Evaluate    ${price} * ${quantity}
    ${total}    Get Text        ${totalPrice}${index}${totalPriceComplement}
    ${actual_total}    Remove String    ${total}    Rs.
    Should Be Equal As Integers    ${expected_total}    ${actual_total}
    END
