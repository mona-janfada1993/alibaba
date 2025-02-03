*** Settings ***
Documentation             A resource file with reusable keywords
Library                   SeleniumLibrary

*** Keywords ***
User goes to Alibaba site and logs in
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    

User navigates to the Tehran-Kish tour page
    Go to login page
    Go to alibaba login page
    Go to login with password page
    Fill in email and password
    Submit your credentials
    Handel vpn popup

        
Go to login page
    Go To    ${HOTEL_PAGE}
    Wait Until Element Is Visible    ${LOGIN_BUTTON}    timeout=10s

Go to alibaba login page
    Click Element    ${LOGIN_BUTTON}
    Wait Until Page Contains     ${LOGIN_TXT}     timeout=10s

Go to login with password page
    Click Element            ${LOGIN_BY_PASSWORD}
    Wait Until Element Is Visible    ${PASSWORD_FIELD}    timeout=10s

Fill in email and password
    Click Element    ${EMAIL_FIELD}
    Input Text      ${EMAIL_FIELD}    ${USER_EMAIL}
    Click Element    ${PASSWORD_FIELD}
    Input Text      ${PASSWORD_FIELD}    ${USER_PASSWORD}

Submit your credentials
    Click Element    ${SUBMIT_BUTTON}
    Wait Until Page Contains    حساب کاربری    timeout=10s  # Ensure login was successful

Handel vpn popup

    ${popup_exists}    Run Keyword And Return Status    Wait Until Element Is Visible    
    ...                 ${VPN_CONFIRM}        timeout=5s
    BuiltIn.Sleep       10s

    IF    ${popup_exists}
        Click Element    ${VPN_CONFIRM}
        Log    "VPN popup appeared and was closed."
    ELSE
        Log    "VPN popup did not appear. Continuing test..."
    END



User selects Miraj hotel
    ${Miraj_Hotel}    Run Keyword And Return Status    Wait Until Element Is Visible    
    ...                 ${HOTEL_BUTTON}       timeout=5s
    BuiltIn.Sleep       10s

    IF    ${Miraj_Hotel}
        Click Element    ${HOTEL_BUTTON}
        Log    "Miraj hotel appeared and was chosen."
    ELSE
        Log    "Miraj hotel did not appear. Continuing test..."
    END


User chooses the first available room
    ${Select_Room}    Run Keyword And Return Status    Wait Until Element Is Visible    
    ...                 ${ROOM_SELECT_BUTTON}       timeout=5s
    BuiltIn.Sleep       10s

    IF    ${Select_Room}
        Click Element    ${ROOM_SELECT_BUTTON}
        Log    "Room selection appeared and was chosen."
    ELSE
        Log    "Room selection did not appear. Continuing test..."
    END    
    


User selects the first available flight
    ${ALL_WINDOWS}    Get Window Handles
    Log    All windows: ${ALL_WINDOWS}   # Debugging - View open windows
    ${NEW_WINDOW}    Set Variable    ${ALL_WINDOWS}[1]  
    Switch Window    ${NEW_WINDOW}
    Wait Until Element Is Visible    ${TOUR_SELECT_BUTTON}    timeout=10s
    Click Element    ${TOUR_SELECT_BUTTON}

User enters personal information
    Wait Until Element Is Visible    ${EN_NAME_FIELD}    timeout=10s
    Enter first name in latin
    Enter last name in latin
    Enter First name in Farsi
    Enter Last name in Farsi
    Choose gender
    Enter national code
    Enter birth date
    Continue to payment page

Enter birth date
    Enter birth date day
    Enter birth date month
    Enter birth date year

Enter last name in latin
    Click Element   ${EN_LAST_NAME_FIELD}
    Input Text      ${EN_LAST_NAME_FIELD}       Janfada 


Enter First name in latin
    Click Element   ${EN_NAME_FIELD}
    Input Text      ${EN_NAME_FIELD}    Mona

Enter First name in Farsi
    Click Element   ${FA_NAME_FIELD}
    Input Text      ${FA_NAME_FIELD}    مونا

Enter Last name in Farsi
    Click Element   ${FA_LAST_NAME_FIELD}
    Input Text      ${FA_LAST_NAME_FIELD}    جانفدا

Choose gender
    Click Element   ${GENDER_FEILD}
    Wait Until Element is Visible       ${FEMALE_GENDER}    timeout=5s
    Click Element   ${FEMALE_GENDER}
    
Enter national code
    Click Element   ${NATIONAL_CODE_FIELD}
    Input Text      ${NATIONAL_CODE_FIELD}    0440440444

Enter birth date day
    Click Element   ${BIRTHDAY_DAY_FIELD}
    Input Text      ${BIRTHDAY_DAY_FIELD}    24

Enter birth date month
    Click Element   ${BIRTHDAY_MONTH_FIELD}
    Input Text      ${BIRTHDAY_MONTH_FIELD}    مرداد

Enter birth date year
    Click Element   ${BIRTHDAY_YEAR_FIELD}
    Input Text      ${BIRTHDAY_YEAR_FIELD}    1372

Continue to payment page
    Click Element   ${CONTINUE_BUTTON}


Then User should see the payment page
    Wait Until Page Contains Element    ${ASSERT_PAYMENT}





