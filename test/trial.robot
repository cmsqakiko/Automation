***Settings***
Documentation                                           This robot script opens your browser to a specified url and then close it after.

Resource                                                template.robot
               
Force Tags                                              sample

Suite Setup                                             Open Website

Suite Teardown                                          Close all Browsers


***Keywords***
Open Website

    Open Browser                                        ${url}[main]                  ${BROWSER}
    Sleep                                               5s

Xss-Aceptance
    [Documentation]                                     Will Test Text field if will accept tags.
    [Arguments]                                         ${xss-lib}
    FOR             ${xss}              IN              @{xss-lib}
        Log To Console                                  ${xss}
    END

***Test Cases***

Test Case One
    Log To Console                                      asdasdasd

All Fields Empty
    [Documentation]                                     Submit the form without any value in username and password field
    [Tags]                                              sample-1
    Wait Until Element Is Visible                       ${login}[container]
    Click Element                                       ${login}[submit][main]
    Element Should be Visible                           ${login}[username][error]     
    Element Should be Visible                           ${login}[password][error]

Test Case One
    Log To Console                                      asdasdasd

Test Case One
    Log To Console                                      asdasdasd