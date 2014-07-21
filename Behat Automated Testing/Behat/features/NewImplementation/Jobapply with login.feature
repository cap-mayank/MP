@jobapplywithlogin
Feature: To test Jobapply with login

@javascript
Scenario Outline: Job apply without alert
Given I maximise the window
And I go to "michaelpage" mypage with env "lt" and country "<country>"
And I login with "lavin.malkani@capgemini.com" and "testtest"
And I wait 5 seconds
And I go to "michaelpage" with env "lt" and country "<country>"
And I search for "<keyword>"
And I click the button "Search"
And I should see "Matching jobs"
And I wait 3 seconds
And I click "//li[@class='views-row views-row-1 views-row-odd views-row-first']/div/a"
And I wait 3 seconds
And I click "//a[contains(text(),'Apply')]"
And I wait 5 seconds
When I fill "jobapply when login" form for country "<country>" and parameters "<firstname>,<lastname>,<email>,<currentjob>,<currentsalary>,<browsecv>,<upload>,<message>,<bcreatalert>,<bprivacy>"
And I wait 2 seconds
And I click "Apply" on "form"
Then I should see <output>

Examples:
|country|keyword|firstname|lastname	|email						|currentjob		|currentsalary		|browsecv	|upload|message |output|	
#For SINGAPORE
|sg		|manager |lavin	   |malkani	|lavin.malkani@capgemini.com|Auditor	  	|					|cv.txt		|1	   |Applying|Thank you for submitting your job application|
|sg		|manager |lavin	   |malkani	|lavin.malkani@capgemini.com|Auditor	  	|					|cv.txt		|1	   |	 	|Thank you for submitting your job application|
|sg		|manager |	   	   |	    |                           |Auditor	  	|					|			|	   | 		|Thank you for submitting your job application|
|sg		|manager |         |malkani	|lavin.malkani@capgemini.com|Auditor	  	|					|cv.txt		|1	   |Applying|This field is required|
|sg		|manager |lavin	   |		|							|Auditor	  	|					|cv.txt		|1	   |Applying|This field is required|
|sg		|manger |lavin	   |malkani	|lavin.malkani@capgemini.com|			    |					|cv.txt		|1	   |Applying|This field is required|
|sg		|manger |lavin	   |malkani	|lavin.malkani@capgemini.com|Auditor	  	|					|			|1	   |Applying| Please attach a file |
|sg		|manger |123	   |malkani |lavin.malkani@capgemini.com|Auditor		|					|cv.txt		|1	   |Applying|This field cannot contain numbers or special characters"  |
|sg		|manager |$£       |malkani |lavin.malkani@capgemini.com|Auditor							|cv.txt		|1	   |Applying|This field cannot contain numbers or special characters|
|sg		|manager |lavin    |123     |lavin.malkani@capgemini.com|Auditor		|					|cv.txt		|1	   |Applying|This field cannot contain numbers or special characters|
|sg		|manager |lavin    |%£      |lavin.malkani@capgemini.com|Auditor		|					|cv.txt		|1	   |Applying|This field cannot contain numbers or special characters|
|sg		|manager |lavin    |malkani |lavin.malkani@capgemini.com|123	 		|					|cv.txt		|1	   |Applying|This field cannot contain numbers or special characters|
|sg		|manager |lavin    |malkani |lavin.malkani@capgemini.com|%£	   	 		|					|cv.txt		|1	   |Applying|This field cannot contain numbers or special characters|
|sg		|manger |lavin     |malkani |"me.com"                   |Auditor		|					|cv.txt		|1	   |Applying|This field is invalid|
|sg		|manager |lavin    |malkani |"#!"                       |Auditor		|					|cv.txt		|1	   |Applying|This field is invalid|
#For Australia
|au		|manager |lavin	   |malkani	|lavin.malkani@capgemini.com|Auditor	  	|					|cv.txt		|1	   |Applying|Thank you for submitting your job application|
|au		|manager |lavin	   |malkani	|lavin.malkani@capgemini.com|Auditor	  	|					|cv.txt		|1	   |	 	|Thank you for submitting your job application|
|au		|manager |	   	   |	    |                           |Auditor	  	|					|			|	   | 		|Thank you for submitting your job application|
|au		|manager |         |malkani	|lavin.malkani@capgemini.com|Auditor	  	|					|cv.txt		|1	   |Applying|This field is required|
|au		|manager |lavin	   |		|							|Auditor	  	|					|cv.txt		|1	   |Applying|This field is required|
|au		|manger |lavin	   |malkani	|lavin.malkani@capgemini.com|			    |					|cv.txt		|1	   |Applying|This field is required|
|au		|manger |lavin	   |malkani	|lavin.malkani@capgemini.com|Auditor	  	|					|			|1	   |Applying| Please attach a file |
|au		|manger |123	   |malkani |lavin.malkani@capgemini.com|Auditor		|					|cv.txt		|1	   |Applying|This field cannot contain numbers or special characters"  |
|au		|manager |$£       |malkani |lavin.malkani@capgemini.com|Auditor							|cv.txt		|1	   |Applying|This field cannot contain numbers or special characters|
|au		|manager |lavin    |123     |lavin.malkani@capgemini.com|Auditor		|					|cv.txt		|1	   |Applying|This field cannot contain numbers or special characters|
|au		|manager |lavin    |%£      |lavin.malkani@capgemini.com|Auditor		|					|cv.txt		|1	   |Applying|This field cannot contain numbers or special characters|
|au		|manager |lavin    |malkani |lavin.malkani@capgemini.com|123	 		|					|cv.txt		|1	   |Applying|This field cannot contain numbers or special characters|
|au		|manager |lavin    |malkani |lavin.malkani@capgemini.com|%£	   	 		|					|cv.txt		|1	   |Applying|This field cannot contain numbers or special characters|
|au		|manger |lavin     |malkani |"me.com"                   |Auditor		|					|cv.txt		|1	   |Applying|This field is invalid|
|au		|manager |lavin    |malkani |"#!"                       |Auditor		|					|cv.txt		|1	   |Applying|This field is invalid|
#For Malaysia
|my		|manager |lavin	   |malkani	|lavin.malkani@capgemini.com|Auditor	  	|					|cv.txt		|1	   |Applying|Thank you for submitting your job application|
|my		|manager |lavin	   |malkani	|lavin.malkani@capgemini.com|Auditor	  	|					|cv.txt		|1	   |	 	|Thank you for submitting your job application|
|my		|manager |	   	   |	    |                           |Auditor	  	|					|			|	   | 		|Thank you for submitting your job application|
|my		|manager |         |malkani	|lavin.malkani@capgemini.com|Auditor	  	|					|cv.txt		|1	   |Applying|This field is required|
|my		|manager |lavin	   |		|							|Auditor	  	|					|cv.txt		|1	   |Applying|This field is required|
|my		|manger |lavin	   |malkani	|lavin.malkani@capgemini.com|			    |					|cv.txt		|1	   |Applying|This field is required|
|my		|manger |lavin	   |malkani	|lavin.malkani@capgemini.com|Auditor	  	|					|			|1	   |Applying| Please attach a file |
|my		|manger |123	   |malkani |lavin.malkani@capgemini.com|Auditor		|					|cv.txt		|1	   |Applying|This field cannot contain numbers or special characters"  |
|my		|manager |$£       |malkani |lavin.malkani@capgemini.com|Auditor							|cv.txt		|1	   |Applying|This field cannot contain numbers or special characters|
|my		|manager |lavin    |123     |lavin.malkani@capgemini.com|Auditor		|					|cv.txt		|1	   |Applying|This field cannot contain numbers or special characters|
|my		|manager |lavin    |%£      |lavin.malkani@capgemini.com|Auditor		|					|cv.txt		|1	   |Applying|This field cannot contain numbers or special characters|
|my		|manager |lavin    |malkani |lavin.malkani@capgemini.com|123	 		|					|cv.txt		|1	   |Applying|This field cannot contain numbers or special characters|
|my		|manager |lavin    |malkani |lavin.malkani@capgemini.com|%£	   	 		|					|cv.txt		|1	   |Applying|This field cannot contain numbers or special characters|
|my		|manger |lavin     |malkani |"me.com"                   |Auditor		|					|cv.txt		|1	   |Applying|This field is invalid|
|my		|manager |lavin    |malkani |"#!"                       |Auditor		|					|cv.txt		|1	   |Applying|This field is invalid|
#For India
|in		|manager |lavin	   |malkani	|lavin.malkani@capgemini.com|Auditor	  	|					|cv.txt		|1	   |Applying|Thank you for submitting your job application|
|in		|manager |lavin	   |malkani	|lavin.malkani@capgemini.com|Auditor	  	|					|cv.txt		|1	   |	 	|Thank you for submitting your job application|
|in		|manager |	   	   |	    |                           |Auditor	  	|					|			|	   | 		|Thank you for submitting your job application|
|in		|manager |         |malkani	|lavin.malkani@capgemini.com|Auditor	  	|					|cv.txt		|1	   |Applying|This field is required|
|in		|manager |lavin	   |		|							|Auditor	  	|					|cv.txt		|1	   |Applying|This field is required|
|in		|manger |lavin	   |malkani	|lavin.malkani@capgemini.com|			    |					|cv.txt		|1	   |Applying|This field is required|
|in		|manger |lavin	   |malkani	|lavin.malkani@capgemini.com|Auditor	  	|					|			|1	   |Applying| Please attach a file |
|in		|manger |123	   |malkani |lavin.malkani@capgemini.com|Auditor		|					|cv.txt		|1	   |Applying|This field cannot contain numbers or special characters"  |
|in		|manager |$£       |malkani |lavin.malkani@capgemini.com|Auditor							|cv.txt		|1	   |Applying|This field cannot contain numbers or special characters|
|in		|manager |lavin    |123     |lavin.malkani@capgemini.com|Auditor		|					|cv.txt		|1	   |Applying|This field cannot contain numbers or special characters|
|in		|manager |lavin    |%£      |lavin.malkani@capgemini.com|Auditor		|					|cv.txt		|1	   |Applying|This field cannot contain numbers or special characters|
|in		|manager |lavin    |malkani |lavin.malkani@capgemini.com|123	 		|					|cv.txt		|1	   |Applying|This field cannot contain numbers or special characters|
|in		|manager |lavin    |malkani |lavin.malkani@capgemini.com|%£	   	 		|					|cv.txt		|1	   |Applying|This field cannot contain numbers or special characters|
|in		|manger |lavin     |malkani |"me.com"                   |Auditor		|					|cv.txt		|1	   |Applying|This field is invalid|
|in		|manager |lavin    |malkani |"#!"                       |Auditor		|					|cv.txt		|1	   |Applying|This field is invalid|
#For hongkong
|hk		|manager |lavin	   |malkani	|lavin.malkani@capgemini.com|Auditor	  	|					|cv.txt		|1	   |Applying|Thank you for submitting your job application|
|hk		|manager |lavin	   |malkani	|lavin.malkani@capgemini.com|Auditor	  	|					|cv.txt		|1	   |	 	|Thank you for submitting your job application|
|hk		|manager |	   	   |	    |                           |Auditor	  	|					|			|	   | 		|Thank you for submitting your job application|
|hk		|manager |         |malkani	|lavin.malkani@capgemini.com|Auditor	  	|					|cv.txt		|1	   |Applying|This field is required|
|hk		|manager |lavin	   |		|							|Auditor	  	|					|cv.txt		|1	   |Applying|This field is required|
|hk		|manger |lavin	   |malkani	|lavin.malkani@capgemini.com|			    |					|cv.txt		|1	   |Applying|This field is required|
|hk		|manger |lavin	   |malkani	|lavin.malkani@capgemini.com|Auditor	  	|					|			|1	   |Applying| Please attach a file |
|hk		|manger |123	   |malkani |lavin.malkani@capgemini.com|Auditor		|					|cv.txt		|1	   |Applying|This field cannot contain numbers or special characters"  |
|hk		|manager |$£       |malkani |lavin.malkani@capgemini.com|Auditor							|cv.txt		|1	   |Applying|This field cannot contain numbers or special characters|
|hk		|manager |lavin    |123     |lavin.malkani@capgemini.com|Auditor		|					|cv.txt		|1	   |Applying|This field cannot contain numbers or special characters|
|hk		|manager |lavin    |%£      |lavin.malkani@capgemini.com|Auditor		|					|cv.txt		|1	   |Applying|This field cannot contain numbers or special characters|
|hk		|manager |lavin    |malkani |lavin.malkani@capgemini.com|123	 		|					|cv.txt		|1	   |Applying|This field cannot contain numbers or special characters|
|hk		|manager |lavin    |malkani |lavin.malkani@capgemini.com|%£	   	 		|					|cv.txt		|1	   |Applying|This field cannot contain numbers or special characters|
|hk		|manger |lavin     |malkani |"me.com"                   |Auditor		|					|cv.txt		|1	   |Applying|This field is invalid|
|hk		|manager |lavin    |malkani |"#!"                       |Auditor		|					|cv.txt		|1	   |Applying|This field is invalid|
#For NewZeeland
|nz		|manager |lavin	   |malkani	|lavin.malkani@capgemini.com|Auditor	  	|					|cv.txt		|1	   |Applying|Thank you for submitting your job application|
|nz		|manager |lavin	   |malkani	|lavin.malkani@capgemini.com|Auditor	  	|					|cv.txt		|1	   |	 	|Thank you for submitting your job application|
|nz		|manager |	   	   |	    |                           |Auditor	  	|					|			|	   | 		|Thank you for submitting your job application|
|nz		|manager |         |malkani	|lavin.malkani@capgemini.com|Auditor	  	|					|cv.txt		|1	   |Applying|This field is required|
|nz		|manager |lavin	   |		|							|Auditor	  	|					|cv.txt		|1	   |Applying|This field is required|
|nz		|manger |lavin	   |malkani	|lavin.malkani@capgemini.com|			    |					|cv.txt		|1	   |Applying|This field is required|
|nz		|manger |lavin	   |malkani	|lavin.malkani@capgemini.com|Auditor	  	|					|			|1	   |Applying| Please attach a file |
|nz		|manger |123	   |malkani |lavin.malkani@capgemini.com|Auditor		|					|cv.txt		|1	   |Applying|This field cannot contain numbers or special characters"  |
|nz		|manager |$£       |malkani |lavin.malkani@capgemini.com|Auditor							|cv.txt		|1	   |Applying|This field cannot contain numbers or special characters|
|nz		|manager |lavin    |123     |lavin.malkani@capgemini.com|Auditor		|					|cv.txt		|1	   |Applying|This field cannot contain numbers or special characters|
|nz		|manager |lavin    |%£      |lavin.malkani@capgemini.com|Auditor		|					|cv.txt		|1	   |Applying|This field cannot contain numbers or special characters|
|nz		|manager |lavin    |malkani |lavin.malkani@capgemini.com|123	 		|					|cv.txt		|1	   |Applying|This field cannot contain numbers or special characters|
|nz		|manager |lavin    |malkani |lavin.malkani@capgemini.com|%£	   	 		|					|cv.txt		|1	   |Applying|This field cannot contain numbers or special characters|
|nz		|manger |lavin     |malkani |"me.com"                   |Auditor		|					|cv.txt		|1	   |Applying|This field is invalid|
|nz		|manager |lavin    |malkani |"#!"                       |Auditor		|					|cv.txt		|1	   |Applying|This field is invalid|

@javascript @totest
Scenario Outline: As a user who is logged in I should be able to apply for a job with valid credentials, uploaded cv and a job alert. (Please enter a valid ref number) .
Given I maximise the window
And I go to "michaelpage" mypage with env "lt" and country "<country>"
And I login with "lavin.malkani@capgemini.com" and "testtest"
And I wait 5 seconds
And I go to "michaelpage" with env "lt" and country "<country>"
And I wait 2 seconds
And I search for "<JobReference>"
And I click the button "Search"
And I wait 2 seconds
And I click "//li[@class='views-row views-row-1 views-row-odd views-row-first views-row-last']/div/a"
And I wait 5 seconds
And I click "//a[contains(text(),'Apply')]"
And I wait 3 seconds
When I fill "jobapply when login" form for country "<country>" and parameters "<firstname>,<lastname>,<email>,<currentjob>,<currentsalary>,<browsecv>,<upload>,<message>,<bcreatalert>,<bprivacy>"
And I wait 2 seconds
And I click "Apply" on "form"
Then I should see "Thank you for submitting your job application"
And I wait 3 seconds
And I click "//*[@href='/mypage/job-alerts']"
And I wait 2 seconds
Then I should see "<JobReference>"

Examples:
|country|JobReference|firstname|lastname|email						|currentjob 	|currentsalary		|browsecv	|upload|message |bcreatalert|bprivacy|	
#For Singapore
|sg		|H107314292	 |lavin|malkani	|lavin.malkani@capgemini.com|Auditor	  	|					|cv.txt		|1     |Applying|1			 |		1  |
#For Australia
|au		|H107314292	 |lavin|malkani	|lavin.malkani@capgemini.com|Auditor	  	|					|cv.txt		|1     |Applying|1			 |		1  |
#For HongKong
|hk		|H107314292	 |lavin|malkani	|lavin.malkani@capgemini.com|Auditor	  	|					|cv.txt		|1     |Applying|1			 |		1  |
#For India		
|in		|H107314292	 |lavin|malkani	|lavin.malkani@capgemini.com|Auditor	  	|					|cv.txt		|1     |Applying|1			 |		1  |
#For Malaysia
|my		|H107314292	 |lavin|malkani	|lavin.malkani@capgemini.com|Auditor	  	|					|cv.txt		|1     |Applying|1			 |		1  |
#For NewZealand
|nz		|H107314292	 |lavin|malkani	|lavin.malkani@capgemini.com|Auditor	  	|					|cv.txt		|1     |Applying|1			 |		1  |

