*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    Chrome
${WELCOME URL}            http://localhost/Scrum/login.php
${EDIT USER STORY URL}    http://localhost/Scrum/edit_backlog.php?id=37
${DELAY}    0


*** Test Case ***
Open Event Edit Product Backlog Page
	Open Browser            ${WELCOME URL}    ${BROWSER}
	Location Should Be      ${WELCOME URL}

	Input Text        username    erza
	Input Password    password    123
	Click Button      submit

	Go To       ${EDIT USER STORY URL}
	
Edit All Data
	Input Text                    userstory_name              As a user, I want to update profile.
    Input Text                    userstory_price             10000.00 
    Input Text                    userstory_priority          13 
	Select From List By Index     userstory_state             1
    Click Button                  SUBMIT
    Wait Until Page Contains      แก้ไข User Story สำเร็จ
	
Edit Name
	Input Text                    userstory_name              As a user
    Click Button                  SUBMIT
    Wait Until Page Contains      แก้ไข User Story สำเร็จ
	
Edit Price
    Input Text                    userstory_price             5000.00
    Click Button                  SUBMIT
    Wait Until Page Contains      แก้ไข User Story สำเร็จ
	
Edit Priority 
    Input Text                    userstory_priority          20 
    Click Button                  SUBMIT
    Wait Until Page Contains      แก้ไข User Story สำเร็จ
	
Edit State
	Select From List By Index     userstory_state             2
    Click Button                  SUBMIT
    Wait Until Page Contains      แก้ไข User Story สำเร็จ
	
No Edit    
    Click Button                  SUBMIT
	Wait Until Page Contains      แก้ไข User Story ไม่สำเร็จ
