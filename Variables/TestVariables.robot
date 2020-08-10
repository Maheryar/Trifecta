*** Settings ***
Documentation    Suite description
Library  SeleniumLibrary
Resource   ../Resources/Trifecta_Keywords.robot

*** Variables ***
#**************ASSERTS EXPECTED RESULT**************
${expected_result_flight_search}    0 Total listings found
#************DATA DRIVEN********************
${CSV_FILE_PATH_STORED_HERE}   C:\\Users\\Viden\\PycharmProjects\\Trifecta\\Data\\Trifecta.csv

#*************FLIGHTS SELECTION************
${flights_button}   css=.flights
${flight_from}   id=s2id_autogen9
${flight_to}   id=s2id_autogen10
${home_page_button}   css=.main-nav-menu > .main-nav:nth-child(1) a
${oneway_radio}   css=.custom-control:nth-child(1) > .custom-control-label
${twoway_radio}   css=.custom-control:nth-child(2) > .custom-control-label


#*************FLIGHTS SEARCH RESULT PAGE************
${flight_result_01}   css=.post-heading

#****************LOGIN PAGE**************
${assert_login_success}   Hi, Demo User
${data_password}   demouser
${data_user_name}   user@phptravels.com
${id_password}    name=password
${id_user_name}   name=username
${login_button}   css=.btn-lg


# *************START PAGE****************
${Browser}  chrome
#${confirm_start_page}   css=.upper
#${login_button}     css=.yx-nfn
${url}   https://phptravels.net/login


#*************VISA SELECTION************
${visa_button}   css=.visa

#*************VISA FORM************
${first_name_location}    xpath=//input[@name='first_name']
${last_name_location}    xpath=//input[@name='last_name']
${email1_location}    xpath=//input[@name='email']
${email2_location}    xpath=//input[@name='confirmemail']
${phone_location}    xpath=//input[@name='phone']
${booking_button}    xpath=//button[@id='sub']
${home_page_button}   xpath=//div[@id='submi']/div/div/a