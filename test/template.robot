# Template Testing for login page of https://login.optimyapp.com/

***Settings***
Library                                             	SeleniumLibrary

Library                                             	FakerLibrary					locale=en_UK

Variables                                           	variables.yaml

Variables												messages.yaml


*** Keywords ***
Open Website
    [Documentation]                                     Opens a Browser
    Open Browser                                        ${url}[main]                  	${BROWSER}
	#Adding Static Sleep to wait for the browser to open
	Sleep                                               3s

Submit Credential
	[Documentation]										Submits the login form by clicking submit button
	[Arguments]                                   		${test_username}                ${test_password}
	Wait Until Element Is Visible                       ${login}[container]
	Input Text											${login}[username][main]		${test_username}				
	Input Text											${login}[password][main]		${test_password}	
    Click Element                                       ${login}[submit][main]				

Return Empty String
	[Documentation]										Returns empty string using robot special variable ${EMPTY}
	[Return]											${EMPTY}

Return ${settable} Random Number
    [Documentation]                                     Returns a ${settable} random number.
    [Return]                                            ${number}
    ${number}                                           Random Number                   digits=${settable}

Generate Random Valid Username
    [Documentation]                                     Generates a valid username containing characters
    ...                                                 Username generated follows the pattern  'Testing' + Current UNIX time.
    ...                                                 UNIX time is provided by the FakerLibrary.
    [Return]                                            Testing${timestamp}
    ${timestamp}                                        Unix Time

Generate Random Valid Email
    [Documentation]                                     Generates a valid email using the FakerLibrary, LOCALE must be set.
	...													will use mailinator as email provider.
    [Return]                                            ${email}
    ${pre}                                              Generate Random Valid Username
    ${email}                                            Set Variable                    ${pre}@mailinator.com
