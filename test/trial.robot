# This script is going to test the website https://login.optimyapp.com/
# Will go through negative scenarios using automation framework RobotFramework with selenium library
# Create By: Francisco G. Quinola
# 05-26-21

***Settings***
Documentation                                               This robot script opens your browser to a specified url and then close it after.

Resource                                                    template.robot
               
Force Tags                                                  sample

Suite Setup                                                 Open Website

Suite Teardown                                              Close all Browsers


***Keywords***
Xss Aceptance
    [Documentation]                                         Will Test Text field if will accept xss.
    [Arguments]                                             ${xss-lib}                      ${test_password}
    ...                                                     ${message}                      ${glyph}
    FOR             ${xss}              IN                  @{xss-lib}
        Submit Credential                                   ${xss}                          ${test_password}
        ${error}                                            Get Text                        ${glyph}   
        Should Be Equal As Strings                          ${error}                        ${message}
    END

Login Test Template Glyph
    [Documentation]                                         Login Acceptance Test Template. Asserts a single field's glyph.
    [Arguments]                                             ${username_key}                 ${password_key}
    ...                                                     ${limit}                        ${message}
    ...                                                     ${glyph}
    FOR  ${index}  IN RANGE                                 0       ${limit}
        ${test_username} =                                  Run Keyword                     ${username_key}
        ${test_password} =                                  Run Keyword                     ${password_key}
        Submit Credential                                   ${test_username}                ${test_password}
        ${error_catcher}                                    Run Keyword And Return Status   Element Should be Visible
        ...                                                 ${glyph}
        IF                                                  ${error_catcher}
            ${error}                                        Get Text                        ${glyph}   
            Should Be Equal As Strings                      ${error}                        ${message}
        ELSE
            Run Keyword And Warn On Failure                 Element Should be Visible       ${glyph}
            ...                                             \nValidation for Minimum and Maximum allowed Character is not available. Please ask Dev to fix
        END
    END

Login Test Template Banner
    [Documentation]                                         Login Acceptance Template Banner. Asserts the message from the
    ...                                                     Banner message coming from the API.
    [Arguments]                                             ${username_key}                 ${password_key}
    ...                                                     ${limit}                        ${message}
    ...                                                     ${modal}
    FOR  ${index}  IN RANGE                                 0       ${limit}
        ${test_username} =                                  Run Keyword                     ${username_key}
        ${test_password} =                                  Run Keyword                     ${password_key}
        Submit Credential                                   ${test_username}                ${test_password}
        Wait Until Element is Visible                       ${modal}                        timeout=30s
        ${error}                                            Get Text                        ${modal} 
        Should Be Equal As Strings                          ${error}                        ${message}
    END

***Test Cases***

All Fields Empty
    [Documentation]                                         Submit the form without any value in username and password field
    [Tags]                                                  sample-1
    Wait Until Element Is Visible                           ${login}[container]
    Click Element                                           ${login}[submit][main]
    Element Should be Visible                               ${login}[username][error]     
    Element Should be Visible                               ${login}[password][error]

User should not be able to login with invalid/unregistered username
    [Documentation]                                         Attempt to login using invalid username.
    [Tags]                                                  login-2
    [Template]                                              Login Test Template Glyph
    Generate Random Valid Username                          Generate Random Valid Username
    ...                                                     10                               ${messages}[login][username][wrong]
    ...                                                     ${login}[username][error]

User should not be able to login with unmatched password
    [Documentation]                                         Attempt to login using invalid password.
    [Tags]                                                  login-3
    [Template]                                              Login Test Template Banner
    Generate Random Valid Email                             Generate Random Valid Username
    ...                                                     3                               ${messages}[login][password][wrong]
    ...                                                     ${modal}[main]

User should not be able to login with empty value on username
    [Documentation]                                         Attempt to login with empty username.
    [Tags]                                                  login-4
    [Template]                                              Login Test Template Glyph
    Return Empty String                                     Generate Random Valid Username
    ...                                                     2                               ${messages}[login][username][empty]
    ...                                                     ${login}[username][error]

User should not be able to login with empty value on password
    [Documentation]                                         Attempt to login with empty password.
    [Tags]                                                  login-5
    [Template]                                              Login Test Template Glyph
    Generate Random Valid Username                          Return Empty String
    ...                                                     2                               ${messages}[login][password][empty]
    ...                                                     ${login}[password][error]

User should not be able to login with less than 6 characters of username
    [Documentation]                                         Attempt to login with less than 6 characters in username.
    [Tags]                                                  login-6
    [Template]                                              Login Test Template Glyph
    Return 5 Random Number                                  Generate Random Valid Username                          
    ...                                                     7                               ${messages}[login][username][less]
    ...                                                     ${login}[username][error]

User should not be able to login with less than 6 characters of password
    [Documentation]                                         Attempt to login with less than 6 characters in password.
    [Tags]                                                  login-7
    [Template]                                              Login Test Template Glyph
    Generate Random Valid Username                          Return 5 Random Number
    ...                                                     7                               ${messages}[login][password][less]
    ...                                                     ${login}[password][error]

User should not be able to login with more that 16 characters of username
    [Documentation]                                         Attempt to login with more than 50 characters in username.
    [Tags]                                                  login-8
    [Template]                                              Login Test Template Glyph
    Return 50 Random Number                                 Generate Random Valid Username
    ...                                                     7                               ${messages}[login][username][more]
    ...                                                     ${login}[username][error]

User should not be able to login with more that 20 characters of password
    [Documentation]                                         Attempt to login with more than 50 characters in password.
    [Tags]                                                  login-9
    [Template]                                              Login Test Template Glyph
    Generate Random Valid Username                          Return 50 Random Number 
    ...                                                     7                               ${messages}[login][password][more]
    ...                                                     ${login}[password][error]

User should not be able to login with xss input on username
    [Documentation]                                         Username field should not accept xss inputs. This will also check if 
    ...                                                     field is accepting different special characters
    [Tags]                                                  login-10
    [Template]                                              Xss Aceptance
    ${xss-lib}                                              ${EMPTY}
    ...                                                     ${messages}[login][username][wrong]                  
    ...                                                     ${login}[username][error]
