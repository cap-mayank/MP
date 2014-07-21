@Smoke
Feature: To test Jobapply 

@javascript
Scenario Outline: Job apply without login
Given I maximise the window
And I go to "pagesite" with env "" and country "<country>"
And I search for "<keyword>"
And I click the button "Search"
And I should see "Matching jobs"
And I wait 3 seconds
And I click "//li[@class='views-row views-row-1 views-row-odd views-row-first']/div/a"
And I wait 5 seconds
And I wait 2 seconds

And I click "Apply" on "form"
Then I should see "<output>"

Examples:
|country|pagesite		|keyword|firstname|lastname	|email						|currentjob		|currentsalary		|browsecv	|message |bcreatalert|bprivacy|output|	
#For Hong Kong
|hk		|pagepersonnel	|manger |lavin	   |malkani	|lavin.malkani@capgemini.com|Auditor	  	|					|cv.txt		|Applying|			 |		  |Thank you for submitting your job application|
|hk		|pagepersonnel	|manger |lavin	   |malkani	|lavin.malkani@capgemini.com|Auditor	  	|					|cv.txt		|	 	 |			 |		  |Thank you for submitting your job application|
#For Hong Kong
|hk		|michaelpage	|manger |lavin	   |malkani	|lavin.malkani@capgemini.com|Auditor	  	|					|cv.txt		|Applying|			 |		  |Thank you for submitting your job application|
|hk		|michaelpage    |manger |lavin	   |malkani	|lavin.malkani@capgemini.com|Auditor	  	|					|cv.txt		|	 	 |			 |		  |Thank you for submitting your job application|
#For SINGAPORE
|sg		|michaelpage	|manger |lavin	   |malkani	|lavin.malkani@capgemini.com|Auditor	  	|					|cv.txt		|Applying|			 |		  |Thank you for submitting your job application|
|sg		|michaelpage	|manger |lavin	   |malkani	|lavin.malkani@capgemini.com|Auditor	  	|					|cv.txt		|	 	 |			 |		  |Thank you for submitting your job application|
#For Australia
|au		|michaelpage	|manger |lavin	   |malkani	|lavin.malkani@capgemini.com|Auditor	  	|					|cv.txt		|Applying|			 |		  |Thank you for submitting your job application|
|au		|michaelpage	|manger |lavin	   |malkani	|lavin.malkani@capgemini.com|Auditor	  	|					|cv.txt		|	 	 |			 |		  |Thank you for submitting your job application|
#For Malaysia
|my		|michaelpage	|manger |lavin	   |malkani	|lavin.malkani@capgemini.com|Auditor	  	|					|cv.txt		|Applying|			 |		  |Thank you for submitting your job application|
|my		|michaelpage	|manger |lavin	   |malkani	|lavin.malkani@capgemini.com|Auditor	  	|					|cv.txt		|	 	 |			 |		  |Thank you for submitting your job application|
#For India
|in		|michaelpage	|manger |lavin	   |malkani	|lavin.malkani@capgemini.com|Auditor	  	|INR 15 - 30 Lacs	|cv.txt		|Applying|			 |		  |Thank you for submitting your job application|
|in		|michaelpage	|manger |lavin	   |malkani	|lavin.malkani@capgemini.com|Auditor	  	|INR 15 - 30 Lacs	|cv.txt		|	 	 |			 |		  |Thank you for submitting your job application|
#For New Zealand
|nz		|michaelpage	|manger |lavin	   |malkani	|lavin.malkani@capgemini.com|Auditor	  	|					|cv.txt		|Applying|			 |		  |Thank you for submitting your job application|
|nz		|michaelpage	|manger |lavin	   |malkani	|lavin.malkani@capgemini.com|Auditor	  	|					|cv.txt		|	 	 |			 |		  |Thank you for submitting your job application|


@javascript
Scenario Outline: Job apply with login
Given I maximise the window
And I go to "pagesite" mypage with env "" and country "<country>"
And I login with "lavin.malkani@capgemini.com" and "testtest"
And I wait 5 seconds
And I go to "pagesite" with env "" and country "<country>"
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
Then I should see "<output>"

Examples:
|country|pagesite	   	|keyword|firstname|lastname	|email						|currentjob		|currentsalary		    |browsecv	|upload|message |bcreatalert|bprivacy|output|	
#For Hong Kong 
|hk	    |pagepersonnel 	|manager |lavin	   |malkani	|lavin.malkani@capgemini.com|	 			|						|cv.txt		|1	   |Applying|			|		 |Thank you for submitting your job application|
|hk		|pagepersonnel 	|manager |lavin	   |malkani	|lavin.malkani@capgemini.com|	  			|						|cv.txt		|1	   |	 	|			|		 |Thank you for submitting your job application|
#For SINGAPORE
|sg		|michaelpage	|manager |lavin	   |malkani	|lavin.malkani@capgemini.com|Auditor	  	|						|cv.txt		|1	   |Applying|			|		 |Thank you for submitting your job application|
|sg		|michaelpage	|manager |lavin	   |malkani	|lavin.malkani@capgemini.com|Auditor	  	|						|cv.txt		|1	   |	 	|			|		 |Thank you for submitting your job application|
#For Australia
|au		|michaelpage	|manager |lavin	   |malkani	|lavin.malkani@capgemini.com|Auditor	  	|						|cv.txt		|1	   |Applying|			|		 |Thank you for submitting your job application|
|au		|michaelpage	|manager |lavin	   |malkani	|lavin.malkani@capgemini.com|Auditor	  	|						|cv.txt		|1	   |	 	|			|		 |Thank you for submitting your job application|
#For Malaysia 
|my		|michaelpage	|manager |lavin	   |malkani	|lavin.malkani@capgemini.com|Auditor	  	|						|cv.txt		|1	   |Applying|			|		 |Thank you for submitting your job application|
|my		|michaelpage	|manager |lavin	   |malkani	|lavin.malkani@capgemini.com|Auditor	  	|						|cv.txt		|1	   |	 	|			|		 |Thank you for submitting your job application|
#For Hong Kong 
|hk	    |michaelpage 	|manager |lavin	   |malkani	|lavin.malkani@capgemini.com|	 			|						|cv.txt		|1	   |Applying|			|		 |Thank you for submitting your job application|
|hk		|michaelpage 	|manager |lavin	   |malkani	|lavin.malkani@capgemini.com|	  			|						|cv.txt		|1	   |	 	|			|		 |Thank you for submitting your job application|
#For India 
|in		|michaelpage 	|manager |lavin	   |malkani	|lavin.malkani@capgemini.com|Auditor	  	|INR 15 - 30 Lacs		|cv.txt		|1	   |Applying|			|		 |Thank you for submitting your job application|
|in		|michaelpage 	|manager |lavin	   |malkani	|lavin.malkani@capgemini.com|Auditor	  	|INR 15 - 30 Lacs		|cv.txt		|1	   |	 	|			|		 |Thank you for submitting your job application|
#For New Zealand 
|nz		|michaelpage 	|manager |lavin	   |malkani	|lavin.malkani@capgemini.com|Auditor	  	|                       |cv.txt		|1	   |Applying|			|		 |Thank you for submitting your job application|
|nz		|michaelpage 	|manager |lavin	   |malkani	|lavin.malkani@capgemini.com|Auditor	  	|		                |cv.txt		|1	   |	 	|			|		 |Thank you for submitting your job application|