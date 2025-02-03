*** Settings ***
Variables  vars.py
Resource   keywords.resource



*** Variables ***

# User Credentials
${USER_EMAIL}    mona.janfada1993@gmail.com
${USER_PASSWORD}    mona1390

*** Test Cases ***
Scenario: User logs in and books a Tehran to Kish tour with Miraj hotel

    Given User goes to Alibaba site and logs in
    When User navigates to the Tehran-Kish tour page
    And User selects Miraj hotel
    And User chooses the first available room
    And User selects the first available flight
    And User enters personal information
    Then User should see the payment page


