*** Settings ***
Library    SeleniumLibrary
Resource    ../keywords/CommonKeywords.robot
Resource    ../keywords/HomepageKeywords.robot
Resource    ../keywords/LoginPageKeywords.robot
Variables    ../resources/testdata/testdata.yaml
Suite Setup    Open Chrome Browser
Suite Teardown    Close Browser

*** Test cases ***
As a user, I want to login success with valid credential
    When user login to Swag labs platform with ${username} and ${valid_password}
    Then Swag labs should display home page and display message as "Products"
    [Teardown]    user logout from Swag Labs platform

As a user, I fail login with empty username
    When user login to Swag labs platform empty username and ${valid_password}
    Then Swag labs should display display validate login fail message as "Epic sadface: Username is required"
    [Teardown]    Swag labs clear data username and password
    
As a user, I fail login with empty password
    When user login to Swag labs platform empty password and ${username}
    Then Swag labs should display display validate login fail message as "Epic sadface: Password is required"
    [Teardown]    Swag labs clear data username and password

As a user, I fail login with empty username and password
    When CommonKeywords.Wait until element is ready then click element    xpath=//input[@type="submit" and @id="login-button"]
    Then Swag labs should display display validate login fail message as "Epic sadface: Username is required"
    [Teardown]    Swag labs clear data username and password

As a user, I fail login with invalid password
    When user login to Swag labs platform with ${username} and ${invalid_password}
    Then Swag labs should display display validate login fail message as "Epic sadface: Username and password do not match any user in this service"
    [Teardown]    Swag labs clear data username and password

As a user, I fail login with invalid username
    When user login to Swag labs platform with ${invalid_username} and ${valid_password}
    Then Swag labs should display display validate login fail message as "Epic sadface: Username and password do not match any user in this service"
    [Teardown]    Swag labs clear data username and password

As a user, I fail login with invalid username and password
    When user login to Swag labs platform with ${invalid_username} and ${invalid_password}
    Then Swag labs should display display validate login fail message as "Epic sadface: Username and password do not match any user in this service"
    [Teardown]    Swag labs clear data username and password


As a user, I fail login with lock username
    When user login to Swag labs platform with ${lock_username} and ${valid_password}
    Then Swag labs should display display validate login fail message as "Epic sadface: Sorry, this user has been locked out."
    [Teardown]    Swag labs clear data username and password
