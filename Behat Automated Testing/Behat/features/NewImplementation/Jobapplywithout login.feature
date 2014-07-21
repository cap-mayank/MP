@jobapply
Feature: To test Jobapply withou login

@javascript
Scenario Outline: Job apply without alert
Given I maximise the window
And I go to "michaelpage" with env "lt" and country "<country>"
And I search for "<keyword>"
And I click the button "Search"
And I should see "Matching jobs"
And I wait 3 seconds
And I click "//li[@class='views-row views-row-1 views-row-odd views-row-first']/div/a"
And I wait 5 seconds
And I wait 3 seconds
And I click "//a[contains(text(),'Apply')]"
And I wait 2 seconds
When I fill "jobapply" form for country "<country>" and parameters "<firstname>,<lastname>,<email>,<currentjob>,<currentsalary>,<browsecv>,<message>,<bcreatalert>,<bprivacy>"
And I wait 2 seconds
And I click "Apply" on "form"
Then I should see "<output>"

Examples:
|country|keyword|firstname|lastname	|email						|currentjob		|currentsalary		|browsecv	|message |bcreatalert|bprivacy|output|	
#For SINGAPORE
|sg		|manger |lavin	   |malkani	|lavin.malkani@capgemini.com|Auditor	  	|					|cv.txt		|Applying|			 |		  |Thank you for submitting your job application|
|sg		|manger |lavin	   |malkani	|lavin.malkani@capgemini.com|Auditor	  	|					|cv.txt		|	 	 |			 |		  |Thank you for submitting your job application|
|sg		|manger |          |malkani	|lavin.malkani@capgemini.com|Auditor	  	|					|cv.txt		|Applying|			 |		  |This field is required|
|sg		|manger |lavin	   |		|							|Auditor	  	|					|cv.txt		|Applying|			 |		  |This field is required|
|sg		|manger |lavin	   |malkani	|lavin.malkani@capgemini.com|			    |					|cv.txt		|Applying|			 |		  |This field is required|
|sg		|manger |lavin	   |malkani	|lavin.malkani@capgemini.com|Auditor	  	|					|			|Applying|			 |		  | Please attach a file |
|sg		|manger |123	   |malkani |lavin.malkani@capgemini.com|Auditor		|					|cv.txt		|Applying|			 |		  |This field cannot contain numbers or special characters|
|sg		|manger |$£        |malkani |lavin.malkani@capgemini.com|Auditor							|cv.txt		|Applying|			 |		  |This field cannot contain numbers or special characters|
|sg		|manger |lavin     |123     |lavin.malkani@capgemini.com|Auditor		|					|cv.txt		|Applying|			 |		  |This field cannot contain numbers or special characters|
|sg		|manger |lavin     |%£      |lavin.malkani@capgemini.com|Auditor		|					|cv.txt		|Applying|			 |		  |This field cannot contain numbers or special characters|
|sg		|manger |lavin     |malkani |lavin.malkani@capgemini.com|123	 		|					|cv.txt		|Applying|			 |		  |This field cannot contain numbers or special characters|
|sg		|manger |lavin     |malkani |lavin.malkani@capgemini.com|%£	   	 		|					|cv.txt		|Applying|			 |		  |This field cannot contain numbers or special characters|
|sg		|manger |lavin     |malkani |"me.com"                   |Auditor		|					|cv.txt		|Applying|			 |		  |This field is invalid|
|sg		|manger |lavin     |malkani |"#!"                       |Auditor		|					|cv.txt		|Applying|			 |		  |This field is invalid|



@javascript @totest
Scenario Outline: As a user who is not logged in but is recognised I should be able to apply for a job with valid credentials, valid cv and a job alert(Please enter a valid ref number) . .
Given I maximise the window
And I go to "michaelpage" with env "lt" and country "<country>"
And I wait 2 seconds
And I search for "<JobReference>"
And I click the button "Search"
And I wait 4 seconds
And I click "//li[@class='views-row views-row-1 views-row-odd views-row-first views-row-last']/div/a"
And I wait 5 seconds
And I click "//a[contains(text(),'Apply')]"
And I wait 3 seconds
When I fill "job-apply" form for country "<country>" and parameters "<firstname>,<lastname>,<email>,<currentjob>,<currentsalary>,<browsecv>,<message>,<bcreatalert>,<bprivacy>"
And I wait 2 seconds
And I click "Apply" on "form"
Then I should see "Thank you for submitting your job application"
And I login with "lavin.malkani@capgemini.com" and "testtest"
And I wait 3 seconds
And I click "//*[@href='/mypage/job-alerts']"
And I wait 2 seconds
Then I should see "<JobReference>"

Examples:
|country|JobReference|firstname|lastname|email						|currentjob 	|currentsalary		|browsecv	|upload|message |bcreatalert|bprivacy|	
#For Australia
|au		|A107314292	 |lavin	   |malkani	|lavin.malkani@capgemini.com|Auditor	  	|					|cv.txt		|1     |Applying|1			|1		 |
