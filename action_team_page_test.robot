*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    Chrome
${WELCOME URL}    http://localhost/Scrum/login.php 
${ACTION_TEAM URL}    http://localhost/Scrum/action_team.php
${INDEX}    http://localhost/Scrum/index.php
${DELAY}    0.02

*** Test Case ***
Open login page
	Open Browser    ${WELCOME URL}    ${BROWSER}
	Location Should Be    ${WELCOME URL}

Input username and password of scrum
	Input Text    username    scrum_ex
	Input Password     password    123
	Click Button    submit

Index page
	Location Should Be    ${INDEX}
	Title Should Be    Scrum Board
	Click Link    product
	Close Browser
	
Check Menu in index page
	
	
