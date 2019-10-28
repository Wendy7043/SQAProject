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
${TEAM}     http://localhost/Scrum/action_team.php
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
	
Action_sprint page
	Location Should Be    ${BACKLOG_ITEM}
	Title Should Be    Scrum Board
	Go To    ${TEAM}
	
Input team name
	Location Should Be    ${TEAM}
	Title Should Be    Scrum Board
	Input Text    team_name    Heacker
	Click Button    add_Team_button
	Page Should Contain    Heacker
	
Not Input name team
	Location Should Be    ${TEAM}
	Title Should Be    Scrum Board
	Click Button    add_Team_button
	
Delete team name
	Location Should Be    ${TEAM}
	Title Should Be    Scrum Board
	Click Button    dropdown_team
	Click Element      xpath: //*[contains(text(), "ลบ")]
	Alert Should Not Be Present    action=ACCEPT , timeout=0