*** Settings ***
Documentation    Suite description
Library         SeleniumLibrary

Resource        ../Variables/TestVariables.robot
Resource        ../Resources/Trifecta_Keywords.robot

Test Setup      Start Automation Setup
Test Teardown   Close Browser

*** Test Cases ***
# robot -d Results Tests\TF0001.robot

TestCase01
# robot -d Results -t TestCase01 Tests\TF0001.robot
    [Tags]    Regression
    Login
    Home Page
    Flight Page
    Assert Search Result

TestCase02
# robot -d Results -t TestCase02 Tests\TF0001.robot
    [Tags]    Regression
    Login
    Home Page
    Visa Page
    Visa Selection
    Fill The Form