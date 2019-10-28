*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    Chrome
${WELCOME URL}       http://localhost/Scrum/login.php
${USER STORY URL}    http://localhost/Scrum/add_backlog.php 
${DELAY}    0


*** Test Case ***
Open Event Edit Product Backlog Page
	Open Browser            ${WELCOME URL}    ${BROWSER}
	Location Should Be      ${WELCOME URL}

	Input Text        username    erza
	Input Password    password    123
	Click Button      submit

	Go To       ${USER STORY URL}

Input All Data
        Input Text                  userstory_name              As a user, I want to update profile.
        Input Text                  userstory_price             10000.00 
        Input Text                  userstory_priority          13 
        Click Button                บันทึก
	Page Should Contain         insert user story1เพิ่ม User Story สำเร็จ 
		
Input Name and Price
	Input Text                  userstory_name              As a user, I want to change name.
        Input Text                  userstory_price             5000.00 
        Click Button                บันทึก
	Page Should Contain         insert user story1เพิ่ม User Story สำเร็จ 
		
Input Name and Priority
	Input Text                  userstory_name              As a user, I want to delete profile.
        Input Text                  userstory_priority          11 
        Click Button                บันทึก
        Page Should Contain         กรุณากรอกข้อมูลให้ครบ
		
Input Price and Priority
	Input Text                  userstory_price             20000.00 
        Input Text                  userstory_priority          5 
        Click Button                บันทึก
	Page Should Contain         กรุณากรอกข้อมูลให้ครบ
		
Input Name
	Input Text                  userstory_name              As a user
        Click Button                บันทึก
        Page Should Contain         กรุณากรอกข้อมูลให้ครบ
		
Input Price
	Input Text                  userstory_price              1500.00
        Click Button                บันทึก
        Page Should Contain         กรุณากรอกข้อมูลให้ครบ

Input Priority
	Input Text                  userstory_priority          25 
        Click Button                บันทึก
        Page Should Contain         กรุณากรอกข้อมูลให้ครบ

No Input
	Click Button                บันทึก
        Page Should Contain         กรุณากรอกข้อมูลให้ครบ

Input Same Name 
        Input Text                  userstory_name              As a user, I want to update profile.
        Input Text                  userstory_price             2000.00 
        Input Text                  userstory_priority          15 
        Click Button                บันทึก
        Page Should Contain         User Story นี้มีอยู่แล้ว

Input Same Price 
        Input Text                  userstory_name              Login 1.
        Input Text                  userstory_price             2000.00 
        Input Text                  userstory_priority          14 
        Click Button                บันทึก
	Page Should Contain         insert user story1เพิ่ม User Story สำเร็จ 

Input Same Priority
        Input Text                  userstory_name              Login 2.
        Input Text                  userstory_price             25000.00 
        Input Text                  userstory_priority          14 
        Click Button                บันทึก
	Page Should Contain         insert user story1เพิ่ม User Story สำเร็จ 
