*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    Chrome
${WELCOME URL}    http://localhost/Scrum/login.php 
${DELAY}    0.02


*** Test Case ***
Open Event Registration Page
	Open Browser    ${WELCOME URL}    ${BROWSER}
	Location Should Be    ${WELCOME URL}
	
Input username
	Input Text    username    nit
	Click Button     submit
	Page Should Contain     กรุณากรอก username และ password
	Location Should Contain    ${WELCOME URL}
	Title Should Be    Scrum Board

Input password
	Input Password    password    123
	Click Button    submit
	Page Should Contain     กรุณากรอก username และ password
	Location Should Contain    ${WELCOME URL}
	Title Should Be    Scrum Board  

Valid username Invalid password
	Input Text     username    nit2
	Input Password    password    123
	Click Button    submit
	Page Should Contain     username หรือ password ผิด
	Location Should Contain    ${WELCOME URL}
	Title Should Be    Scrum Board 
	
Valid password Invalid username
	Input Text     username    nit
	Input Password    password    1234
	Click Button    submit
	Page Should Contain     username หรือ password ผิด
	Location Should Contain    ${WELCOME URL}
	Title Should Be    Scrum Board
	
Valid username Valid password
	Input Text     username    nit2
	Input Password    password    1234
	Click Button    submit
	Page Should Contain     username หรือ password ผิด
	Location Should Contain    ${WELCOME URL}
	Title Should Be    Scrum Board

Don't have input username and password
	Click Button    submit
	Page Should Contain     กรุณากรอก username และ password
	Location Should Contain    ${WELCOME URL}
	Title Should Be    Scrum Board  

Input username and password
	Input Text    username    nit
	Input Password    password    123
	Click Button     submit
	
