*** Settings ***
Documentation     Add products to cart

Library           SeleniumLibrary

Resource        ../Resources/landingPage.robot
Resource       ../Resources/productsPage.robot
Resource       ../Resources/cartPage.robot

Suite Setup    Start test cases
Suite Teardown    Close test Cases

*** Variables ***
@{Products}    Men Tshirt    Blue Top    Summer White Top    Stylish Dress    Winter Top

*** Test Cases ***
Add products to cart
    Click products Page
    Verify if search bar is visible
    Add items to cart    @{Products}
    Click cart Page
    Verify if added products to cart exists     @{Products}
    Verify products values    @{Products}
