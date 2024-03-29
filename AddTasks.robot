*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    Chrome
${WELCOME URL}            http://localhost/Scrum/login.php
${TASKS URL}    http://localhost/Scrum/add_tasks.php
${DELAY}    0


*** Test Case ***
Open Event Edit Product Backlog Page
	Open Browser            ${WELCOME URL}    ${BROWSER}
	Location Should Be      ${WELCOME URL}

	Input Text        username    scrum
	Input Password    password    123
	Click Button      submit

	Go To       ${TASKS URL}
	
Input Task Name and Estimate Value
    Input Text             task_name         Form Design        
    Input Text             task_estimate     3               
    Click Button           เลือก Task
	Should Not Contain
	
Input Task Name 
    Input Text             task_name         Form             
    Click Button           เลือก Task
	Should Not Contain
    
Input Estimate Value
    Input Text             task_estimate     5               
    Click Button           เลือก Task
	Should Not Contain
	
No Input                
    Click Button           เลือก Task
	Should Not Contain