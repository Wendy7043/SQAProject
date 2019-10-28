*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    Chrome
${WELCOME URL}    http://localhost/Scrum/login.php 
${ACTION_SPRINT}    http://localhost/Scrum/action_sprint.php
${INDEX}    http://localhost/Scrum/index.php
${BACKLOG_ITEM}    http://localhost/Scrum/backlog_item.php
${ISSUES}    http://localhost/Scrum/action_issues.php?id=1
${ADD_ISSUES}     http://localhost/Scrum/add_issues.php?id=1
${DESC}     http://localhost/Scrum/desc_sprint.php?id=1
${BURN_CART}     http://localhost/Scrum/summary.php?id=1
${COMMENT}    http://localhost/Scrum/comment_issues.php?id=1&sprint_id=1
${DELETE}    http://localhost/Scrum/delete_sprint.php?id=1
${PROFILE URL}      http://localhost/Scrum/profiles.php
${DELAY}    0.02

*** Test Case ***
Open login page
	Open Browser    ${WELCOME URL}    ${BROWSER}
	Location Should Be    ${WELCOME URL}
	
Input username and password of scrum
	Input Text    username    scrum_ex
	Input Password     password    123
	Click Button    submit

Profile page
	Location Should Be    ${INDEX}
	Title Should Be    Scrum Board
	Click Element                  class:dropdown
    Click Element                  xpath: //*[contains(text(), "Profile")]
	Location Should Contain        ${PROFILE URL}
    Title Should Be                Scrum Board
    Wait Until Page Contains        scrum master
	Page Should Contain     scrum@hotmail.com
	Page Should Contain     Scrum Master
	Page Should Contain     Scrum master
    
Edit profile page
	Location Should Be    ${PROFILE URL}
	Title Should Be    Scrum Board
	Click Element    xpath: //*[contains(text(), "Edit")]
	

	