*** Settings ***
Documentation    Suite description
Resource   ../Variables/TestVariables.robot
Library  ../CstmLibs/Csv.py

*** Keywords ***
Start Automation Setup
    Open Browser  ${url}   ${Browser}
    Maximize Browser Window
    Wait Until Page Contains   Login
Login
    Input Text   ${id_user_name}   ${data_user_name}
    Input Text   ${id_password}   ${data_password}
    Click Button  ${login_button}
    Wait Until Page Contains   ${assert_login_success}
Home Page
        Click Link   ${home_page_button}
        Wait Until Page Contains         Flights
Flight Page

    Click Element   ${flights_button}
    Click Element   ${twoway_radio}
    Press Keys    None   TAB
    Press Keys    None   LAX
    sleep  1s
    Wait Until Page Contains Element   ${flight_from}
    Press Keys    None   TAB
    sleep  1s
    Wait Until Page Contains Element   ${flight_to}
    Press Keys    None   LHR
    sleep   1s

    Press Keys    None   TAB
    sleep   1s
    Press Keys    None   ARROW_DOWN
    Sleep   1s
    Press Keys    None   ENTER

    sleep   1s
    Press Keys    None   ARROW_DOWN
    Press Keys    None   ARROW_DOWN
    Press Keys    None   ENTER

Assert Search Result
     ${flight_search_result}=  Get Text   ${flight_result_01}
     should be equal as strings     ${flight_search_result}   ${expected_result_flight_search}
Visa Page
     sleep   1s
     Click Element   ${visa_button}

Visa Selection
     Click Element   xpath=//div[@id='visa']/div/div/form/div/div/div/div/div[2]/div/a/div
     Click Element   xpath=//div[@id='visa']/div/div/form/div/div/div/div/div[2]/div/div/ul/li[21]
     click Element   xpath=//div[@id='visa']/div/div/form/div/div/div[2]/div/div[2]/div/a/div
     Click Element   xpath=//div[@id='visa']/div/div/form/div/div/div[2]/div/div[2]/div/div/ul/li[28]
     sleep   500ms
     Press Keys    None   TAB
     sleep   500ms
     Press Keys    None   ARROW_DOWN
     Sleep   300ms
     Press Keys    None   ENTER
     Click Element   xpath=(//button[@type='submit'])[7]


#@{saverowsofdata}   Get CSV Data   ${CSV_FILE_PATH_STORED_HERE}
Fill The Form
    @{saverowsofdata} =  Get CSV Data   ${CSV_FILE_PATH_STORED_HERE}
    sleep  2s
    :FOR  ${singlerows}   IN   @{saverowsofdata}
    \   log   ${singlerows}
    \   Run Keyword And Continue on Failure   Input Text   ${first_name_location}    ${singlerows[0]}
    \   Run Keyword And Continue on Failure   Input Text   ${last_name_location}     ${singlerows[1]}
    \   Run Keyword And Continue on Failure   Input Text   ${email1_location}         ${singlerows[2]}
    \   Run Keyword And Continue on Failure   Input Text   ${email2_location}           ${singlerows[3]}
    \   Run Keyword And Continue on Failure   Input Text   ${phone_location}            ${singlerows[4]}
    \   Run Keyword And Continue on Failure   Click Element   ${booking_button}
    \   Run Keyword And Continue on Failure   Click Element   ${home_page_button}
    \   Visa Page
    \   Visa Selection

Get CSV Data
    [Arguments]  ${FilePath}   # pass in filepath for csv file
    ${Data} =   SG csv file   ${FilePath}
    [Return]  ${Data}