*** Settings ***
Library   SeleniumLibrary

Test Setup     Open Browser  ${URL}  ${BROWSER}
Test Teardown  Close Browser

*** Variables ***
${URL}       http://automationpractice.com/index.php
${BROWSER}  firefox

*** Test Case ***
 Scenario 01: sign in and shop
  Click Element                  xpath=//h5/a[@title="Faded Short Sleeve T-shirts"]
  Select From List By Label      group_1   L
  Click Element                  id=color_14
  Click Button                   name=Submit   
  Page Should Contain            Product successfully added to your shopping cart
  Wait Until Element Is Visible  //a[@title='Proceed to checkout']  10
  Click Link                     //a[@title='Proceed to checkout']
  Title Should Be                Order - My Store          
  Click Element                  //p/a[@title='Proceed to checkout']
  Title Should Be                Login - My Store          
  Input Text                     id=email_create  mynameiswhat@email.com
  Click Button                   id=SubmitCreate
  Wait Until Element Is Visible  id=account-creation_form  10
  Click Element                  id=id_gender1
  Input Text                     id=customer_firstname   Philippus
  Input Text                     id=customer_lastname    Viola
  Input Text                     id=email                mynameiswhat@email.com
  Input Text                     id=passwd               shrek2
  Select From List By Index      id=days                 8
  Select From List By Index      id=months               8
  Select From List By Value      id=years                2001
  Select Checkbox                id=newsletter
  Select Checkbox                id=optin
  Input Text                     id=firstname           Philippus
  Input Text                     id=lastname            Viola
  Input Text                     id=company             DunderMifflin.inc
  Input Text                     id=address1            1725 Slought Av, BOX 4
  Input Text                     id=address2            unit
  Input Text                     id=city                Scranton
  Select From List By Value      id=id_state            38
  Input Text                     id=postcode            18505
  Input Text                     id=other               get out of my swamp
  Input Text                     id=phone               1234567
  Input Text                     id=phone_mobile        7654321
  Input Text                     id=alias               Groove St, Los Santos
  Click Element                  id=submitAccount
  Title Should Be                Order - My Store
  Input Text                     name=message           no tomato please
  Click Button                   name=processAddress
  Wait Until Element Is Visible  name=processCarrier    10
  Select Checkbox                id=cgv
  Click Button                   name=processCarrier
  Click Element                  xpath=//p/a[@title="Pay by bank wire"]
  Title Should Be                My Store
  Wait Until Element Is Visible  //p/button
  Click Button                   //p/button
  Title Should Be                Order confirmation - My Store
  Sleep                10s