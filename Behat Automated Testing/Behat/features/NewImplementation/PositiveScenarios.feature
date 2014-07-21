@positive
Feature: All positive scenarios (Smoke) for major functionalities : Search (user logged in and user not logged in), Submit CV, Job Apply

@javascript
Scenario Outline: Searching for jobs using keyword view and performing all filters along with Save Search and Create job Alert for the search for logged in user
Precondition -> The email address provided below should be registered with the password
Given I maximise the window
And I go to "<pagesite>" mypage with env "uat" and country "<country>"
And I login with "sahil.mehta@capgemini.com  " and "testtest"
And I wait 2 seconds
And I go to "<pagesite>" with env "uat" and country "<country>"
And I wait 5 seconds
And I search jobs with Keywords "sales" and also filtering the search with salary location sector and sub-sector filters for Page site "<pagesite>"
And I wait 2 seconds
And I click the button "Save search"
And I wait 10 seconds
And I click "Continue" on "popup"
And I wait 3 seconds
And I click the button "Create a job alert"
And I wait 10 seconds
And I click "Continue" on "popup"
And I wait 3 seconds
Then I verify and validate the saved search and job alert created

Examples:
|country|pagesite	    |
|hk		|pagepersonnel  |
|hk		|michaelpage    |
|au		|michaelpage  	|
|sg		|michaelpage  	|
|in		|michaelpage  	|
|my		|michaelpage  	|
|nz		|michaelpage  	|

@javascript
Scenario Outline: Searching for jobs using keyword view and performing all filters along with Save Search and Create job Alert for the search
User is not logged in
Given I maximise the window
And I go to "<pagesite>" with env "uat" and country "<country>"
And I search jobs with Keywords "manager,marketing" and also filtering the search with salary location sector and sub-sector filters for Page site "<pagesite>"
And I wait 2 seconds
And I click the button "Save search"
And I wait 5 seconds
And I click "Login" on "popup"
And I wait 3 seconds
Then I should see "Login to mypage"
And I move backward one page
And I wait 2 seconds
And I click the button "Save search"
And I wait 5 seconds
And I click "Register" on "popup"
And I wait 3 seconds
Then I should see "Signup for mypage"
And I move backward one page
And I wait 3 seconds
And I click the button "Create a job alert"
And I wait 5 seconds
And I click "Login" on "popup"
And I wait 3 seconds
Then I should see "Login to mypage"
And I move backward one page
And I wait 3 seconds
And I click the button "Create a job alert"
And I wait 5 seconds
And I click "Register" on "popup"
And I wait 3 seconds
Then I should see "Signup for mypage"

Examples:
|country|pagesite	   |
|hk		|pagepersonnel |
|hk		|michaelpage   |
|au		|michaelpage   |
|sg		|michaelpage   |
|in		|michaelpage   |
|my		|michaelpage   |
|nz		|michaelpage   |

@javascript
Scenario Outline: Test for all scenarios while Submitting CV when user is not logged in
Given I maximise the window
And I go to "<pagesite>" with env "uat" and country "<country>"
And I wait 5 seconds
When I click "Submit your CV" on "sliders"
And I wait 3 seconds
When I fill "Submit CV" form for country "<country>" and parameters "<fname>,<lname>,<email>,<comments>,<title>,<salary>,<location_hk>,<location_au>,<location_sg>,<location_in>,<location_my>,<location_nz>,<sector>,<jobtype>,<cv>,<checkbox>"
And I wait 6 seconds
And I click the button "Submit"
And I wait 5 seconds
Then I should see "<output>"

Examples:
|country|pagesite	  |fname|lname|email					|comments|title|salary_in	    |location_hk|location_au|location_sg|location_in|location_my |location_nz|sector|jobtype  |cv	   	  |checkbox|output|
#For Hong Kong
|hk		|michaelpage  |sahil|mehta|sahil.mehta@capgemini.com|		 |	   |			    |Hong Kong  |Darwin	    |Bangkok	|Mumbai	    |Kuala Lumpur|Auckland   |Sales |Permanent|cv.txt	  |0		|Thank you for your submission|
|hk		|michaelpage  |sahil|mehta|sahil.mehta@capgemini.com|comments|	   |			    |Hong Kong  |Darwin	    |Bangkok	|Mumbai	    |Kuala Lumpur|Auckland   |Sales |Permanent|cv.txt	  |0		|Thank you for your submission|
#For Australia
|au		|michaelpage  |sahil|mehta|sahil.mehta@capgemini.com|comments|	   |			    |Hong Kong  |Darwin	    |Bangkok	|Mumbai	    |Kuala Lumpur|Auckland   |Sales |Permanent|cv.txt	  |1		|Thank you for your submission|
|au		|michaelpage  |sahil|mehta|sahil.mehta@capgemini.com|comments|	   |			    |Hong Kong  |Darwin	    |Bangkok	|Mumbai	    |Kuala Lumpur|Auckland   |Sales |Permanent|cv.txt	  |0		|Thank you for your submission|
#For Singapore
|sg		|michaelpage  |sahil|mehta|sahil.mehta@capgemini.com|		 |title|			    |Hong Kong  |Darwin	    |Bangkok	|Mumbai	    |Kuala Lumpur|Auckland   |Sales |Permanent|cv.txt	  |0		|Thank you for your submission|
|sg		|michaelpage  |sahil|mehta|sahil.mehta@capgemini.com|comments|title|			    |Hong Kong  |Darwin	    |Bangkok	|Mumbai	    |Kuala Lumpur|Auckland   |Sales |Permanent|cv.txt	  |0		|Thank you for your submission|
#For India
|in		|michaelpage  |sahil|mehta|sahil.mehta@capgemini.com|		 |title|INR 10 - 20 Lacs|Hong Kong  |Darwin	    |Bangkok	|Mumbai	    |Kuala Lumpur|Auckland   |Sales |Permanent|cv.txt	  |0		|Thank you for your submission|
|in		|michaelpage  |sahil|mehta|sahil.mehta@capgemini.com|comments|title|INR 10 - 20 Lacs|Hong Kong  |Darwin	    |Bangkok	|Mumbai	    |Kuala Lumpur|Auckland   |Sales |Permanent|cv.txt	  |0		|Thank you for your submission|
#For Malaysia
|my		|michaelpage  |sahil|mehta|sahil.mehta@capgemini.com|		 |	   |			    |Hong Kong  |Darwin	    |Bangkok	|Mumbai	    |Kuala Lumpur|Auckland   |Sales |Permanent|cv.txt	  |0		|Thank you for your submission|
|my		|michaelpage  |sahil|mehta|sahil.mehta@capgemini.com|comments|	   |				|Hong Kong  |Darwin	    |Bangkok	|Mumbai	    |Kuala Lumpur|Auckland   |Sales |Permanent|cv.txt	  |0		|Thank you for your submission|
#For New Zealand
|nz		|michaelpage  |sahil|mehta|sahil.mehta@capgemini.com|		 |	   |				|Hong Kong  |Darwin	    |Bangkok	|Mumbai	    |Kuala Lumpur|Auckland   |Sales |Permanent|cv.txt	  |0		|Thank you for your submission|
|nz		|michaelpage  |sahil|mehta|sahil.mehta@capgemini.com|comments|	   |				|Hong Kong  |Darwin	    |Bangkok	|Mumbai	    |Kuala Lumpur|Auckland   |Sales |Permanent|cv.txt	  |0		|Thank you for your submission|
#For PP Hong Kong
|hk		|pagepersonnel|sahil|mehta|sahil.mehta@capgemini.com|		 |	   |				|Hong Kong  |Darwin	    |Bangkok	|Mumbai	    |Kuala Lumpur|Auckland   |Sales |Permanent|cv.txt	  |0		|Thank you for your submission|
|hk		|pagepersonnel|sahil|mehta|sahil.mehta@capgemini.com|comments|	   |				|Hong Kong  |Darwin	    |Bangkok	|Mumbai	    |Kuala Lumpur|Auckland   |Sales |Permanent|cv.txt	  |0		|Thank you for your submission|

@javascript
Scenario Outline: Job apply without login
Given I maximise the window
And I go to "pagesite" with env "uat" and country "<country>"
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
|country|pagesite		|keyword|firstname|lastname	|email						|currentjob		|currentsalary		|browsecv	|message |bcreatalert|bprivacy|output|	
#For Hong Kong
|hk		|pagepersonnel	|manger |lavin	   |malkani	|sahil.mehta@capgemini.com  |Auditor	  	|					|cv.txt		|Applying|			 |		  |Thank you for submitting your job application|
|hk		|pagepersonnel	|manger |lavin	   |malkani	|sahil.mehta@capgemini.com  |Auditor	  	|					|cv.txt		|	 	 |			 |		  |Thank you for submitting your job application|
#For Hong Kong
|hk		|michaelpage	|manger |lavin	   |malkani	|sahil.mehta@capgemini.com  |Auditor	  	|					|cv.txt		|Applying|			 |		  |Thank you for submitting your job application|
|hk		|michaelpage    |manger |lavin	   |malkani	|sahil.mehta@capgemini.com  |Auditor	  	|					|cv.txt		|	 	 |			 |		  |Thank you for submitting your job application|
#For SINGAPORE
|sg		|michaelpage	|manger |lavin	   |malkani	|sahil.mehta@capgemini.com  |Auditor	  	|					|cv.txt		|Applying|			 |		  |Thank you for submitting your job application|
|sg		|michaelpage	|manger |lavin	   |malkani	|sahil.mehta@capgemini.com  |Auditor	  	|					|cv.txt		|	 	 |			 |		  |Thank you for submitting your job application|
#For Australia
|au		|michaelpage	|manger |lavin	   |malkani	|sahil.mehta@capgemini.com  |Auditor	  	|					|cv.txt		|Applying|			 |		  |Thank you for submitting your job application|
|au		|michaelpage	|manger |lavin	   |malkani	|sahil.mehta@capgemini.com  |Auditor	  	|					|cv.txt		|	 	 |			 |		  |Thank you for submitting your job application|
#For Malaysia
|my		|michaelpage	|manger |lavin	   |malkani	|sahil.mehta@capgemini.com  |Auditor	  	|					|cv.txt		|Applying|			 |		  |Thank you for submitting your job application|
|my		|michaelpage	|manger |lavin	   |malkani	|sahil.mehta@capgemini.com  |Auditor	  	|					|cv.txt		|	 	 |			 |		  |Thank you for submitting your job application|
#For India
|in		|michaelpage	|manger |lavin	   |malkani	|sahil.mehta@capgemini.com  |Auditor	  	|INR 15 - 30 Lacs	|cv.txt		|Applying|			 |		  |Thank you for submitting your job application|
|in		|michaelpage	|manger |lavin	   |malkani	|sahil.mehta@capgemini.com  |Auditor	  	|INR 15 - 30 Lacs	|cv.txt		|	 	 |			 |		  |Thank you for submitting your job application|
#For New Zealand
|nz		|michaelpage	|manger |lavin	   |malkani	|sahil.mehta@capgemini.com  |Auditor	  	|					|cv.txt		|Applying|			 |		  |Thank you for submitting your job application|
|nz		|michaelpage	|manger |lavin	   |malkani	|sahil.mehta@capgemini.com  |Auditor	  	|					|cv.txt		|	 	 |			 |		  |Thank you for submitting your job application|


@javascript
Scenario Outline: Job apply with login
Given I maximise the window
And I go to "pagesite" mypage with env "uat" and country "<country>"
And I login with "sahil.mehta@capgemini.com  " and "testtest"
And I wait 5 seconds
And I go to "pagesite" with env "uat" and country "<country>"
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
|hk	    |pagepersonnel 	|manager |lavin	   |malkani	|sahil.mehta@capgemini.com  |	 			|						|cv.txt		|1	   |Applying|			|		 |Thank you for submitting your job application|
|hk		|pagepersonnel 	|manager |lavin	   |malkani	|sahil.mehta@capgemini.com  |	  			|						|cv.txt		|1	   |	 	|			|		 |Thank you for submitting your job application|
#For SINGAPORE
|sg		|michaelpage	|manager |lavin	   |malkani	|sahil.mehta@capgemini.com  |Auditor	  	|						|cv.txt		|1	   |Applying|			|		 |Thank you for submitting your job application|
|sg		|michaelpage	|manager |lavin	   |malkani	|sahil.mehta@capgemini.com  |Auditor	  	|						|cv.txt		|1	   |	 	|			|		 |Thank you for submitting your job application|
#For Australia
|au		|michaelpage	|manager |lavin	   |malkani	|sahil.mehta@capgemini.com  |Auditor	  	|						|cv.txt		|1	   |Applying|			|		 |Thank you for submitting your job application|
|au		|michaelpage	|manager |lavin	   |malkani	|sahil.mehta@capgemini.com  |Auditor	  	|						|cv.txt		|1	   |	 	|			|		 |Thank you for submitting your job application|
#For Malaysia 
|my		|michaelpage	|manager |lavin	   |malkani	|sahil.mehta@capgemini.com  |Auditor	  	|						|cv.txt		|1	   |Applying|			|		 |Thank you for submitting your job application|
|my		|michaelpage	|manager |lavin	   |malkani	|sahil.mehta@capgemini.com  |Auditor	  	|						|cv.txt		|1	   |	 	|			|		 |Thank you for submitting your job application|
#For Hong Kong 
|hk	    |michaelpage 	|manager |lavin	   |malkani	|sahil.mehta@capgemini.com  |	 			|						|cv.txt		|1	   |Applying|			|		 |Thank you for submitting your job application|
|hk		|michaelpage 	|manager |lavin	   |malkani	|sahil.mehta@capgemini.com  |	  			|						|cv.txt		|1	   |	 	|			|		 |Thank you for submitting your job application|
#For India 
|in		|michaelpage 	|manager |lavin	   |malkani	|sahil.mehta@capgemini.com  |Auditor	  	|INR 15 - 30 Lacs		|cv.txt		|1	   |Applying|			|		 |Thank you for submitting your job application|
|in		|michaelpage 	|manager |lavin	   |malkani	|sahil.mehta@capgemini.com  |Auditor	  	|INR 15 - 30 Lacs		|cv.txt		|1	   |	 	|			|		 |Thank you for submitting your job application|
#For New Zealand 
|nz		|michaelpage 	|manager |lavin	   |malkani	|sahil.mehta@capgemini.com  |Auditor	  	|                       |cv.txt		|1	   |Applying|			|		 |Thank you for submitting your job application|
|nz		|michaelpage 	|manager |lavin	   |malkani	|sahil.mehta@capgemini.com  |Auditor	  	|		                |cv.txt		|1	   |	 	|			|		 |Thank you for submitting your job application|

