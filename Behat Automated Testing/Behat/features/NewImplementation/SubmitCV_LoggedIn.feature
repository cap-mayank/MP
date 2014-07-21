@submitcv @login @runsam1
Feature: Submit CV with user logged in

@javascript
Scenario Outline: Test for all scenarios while Submitting CV when user is logged invalid. 
Precondition -> The email address provided below should be registered with the password
Given I maximise the window
And I go to "michaelpage" mypage with env "uat" and country "<country>"
And I login with "sahil.mehta@capgemini.com" and "testtest"
And I wait 2 seconds
And I go to "michaelpage" with env "uat" and country "<country>"
And I wait 5 seconds
When I click "Submit your CV" on "sliders"
And I wait 3 seconds
When I fill "Submit CV" form for country "<country>" and parameters "<fname>,<lname>,<email>,<comments>,<title>,<salary>,<location_hk>,<location_au>,<location_sg>,<location_in>,<location_my>,<location_nz>,<sector>,<jobtype>,<cv>,<checkbox>"
And I wait 6 seconds
And I click the button "Submit"
And I wait 5 seconds
Then I should see "<output>"
And I wait 2 seconds
And I logout

Examples:
|country|fname|lname|email					  |comments|title|salary_in		  |location_hk|location_au|location_sg|location_in|location_my |location_nz|sector|jobtype	|cv	   	  |checkbox|output|
#For Hong Kong
|hk		|	  |mehta|sahil.mehta@capgemini.com|comments|	 |				  |Hong Kong  |Darwin	  |Bangkok	  |Mumbai	  |Kuala Lumpur|Auckland   |Sales |Permanent|cv.txt	  |0		|This field is required|
|hk		|sahil|		|sahil.mehta@capgemini.com|comments|	 |				  |Hong Kong  |Darwin	  |Bangkok	  |Mumbai	  |Kuala Lumpur|Auckland   |Sales |Permanent|cv.txt	  |0		|This field is required|
|hk		|sahil|mehta|						  |comments|	 |				  |Hong Kong  |Darwin	  |Bangkok	  |Mumbai	  |Kuala Lumpur|Auckland   |Sales |Permanent|cv.txt	  |0		|This field is required|
|hk		|sahil|mehta|sahil.mehta@capgemini.com|comments|	 |				  |			  |			  |			  |			  |			   |		   |Sales |Permanent|cv.txt	  |0		|This field is required|
|hk		|sahil|mehta|sahil.mehta@capgemini.com|comments|	 |				  |Hong Kong  |Darwin	  |Bangkok	  |Mumbai	  |Kuala Lumpur|Auckland   |	  |Permanent|cv.txt	  |0		|This field is required|
|hk		|sahil|mehta|sahil.mehta@capgemini.com|comments|	 |				  |Hong Kong  |Darwin	  |Bangkok	  |Mumbai	  |Kuala Lumpur|Auckland   |Sales |		 	|cv.txt	  |0		|This field is required|
|hk		|sahil|mehta|sahil.mehta@capgemini.com|comments|	 |				  |Hong Kong  |Darwin	  |Bangkok	  |Mumbai	  |Kuala Lumpur|Auckland   |Sales |Permanent|	   	  |0		|This field is required|
|hk		|123@!|mehta|sahil.mehta@capgemini.com|comments|	 |				  |Hong Kong  |Darwin	  |Bangkok	  |Mumbai	  |Kuala Lumpur|Auckland   |Sales |Permanent|cv.txt	  |0		|This field cannot contain numbers or special characters|
|hk		|sahil|123@!|sahil.mehta@capgemini.com|comments|	 |				  |Hong Kong  |Darwin	  |Bangkok	  |Mumbai	  |Kuala Lumpur|Auckland   |Sales |Permanent|cv.txt	  |0		|This field cannot contain numbers or special characters|
|hk		|sahil|mehta|sahil.mehta			  |comments|	 |				  |Hong Kong  |Darwin	  |Bangkok	  |Mumbai	  |Kuala Lumpur|Auckland   |Sales |Permanent|cv.txt	  |0		|This field is invalid|
|hk		|sahil|mehta|sahil.mehta@capgemini.com|comments|	 |				  |Hong Kong  |Darwin	  |Bangkok	  |Mumbai	  |Kuala Lumpur|Auckland   |Sales |Permanent|cv.jpg	  |0		|CV format must be TXT, PDF or DOC|
|hk		|sahil|mehta|sahil.mehta@capgemini.com|comments|	 |				  |Hong Kong  |Darwin	  |Bangkok	  |Mumbai	  |Kuala Lumpur|Auckland   |Sales |Permanent|cv500.txt|0		|CV file must not exceed 400KB|
|hk		|sahil|mehta|sahil.mehta@capgemini.com|		   |	 |				  |Hong Kong  |Darwin	  |Bangkok	  |Mumbai	  |Kuala Lumpur|Auckland   |Sales |Permanent|cv.txt	  |0		|Thank you for your submission|
|hk		|sahil|mehta|sahil.mehta@capgemini.com|comments|	 |				  |Hong Kong  |Darwin	  |Bangkok	  |Mumbai	  |Kuala Lumpur|Auckland   |Sales |Permanent|cv.txt	  |0		|Thank you for your submission|
#For Australia
|au		|	  |mehta|sahil.mehta@capgemini.com|comments|	 |				  |Hong Kong  |Darwin	  |Bangkok	  |Mumbai	  |Kuala Lumpur|Auckland   |Sales |Permanent|cv.txt	  |0		|This field is required|
|au		|sahil|		|sahil.mehta@capgemini.com|comments|	 |				  |Hong Kong  |Darwin	  |Bangkok	  |Mumbai	  |Kuala Lumpur|Auckland   |Sales |Permanent|cv.txt	  |0		|This field is required|
|au		|sahil|mehta|						  |comments|	 |				  |Hong Kong  |Darwin	  |Bangkok	  |Mumbai	  |Kuala Lumpur|Auckland   |Sales |Permanent|cv.txt	  |0		|This field is required|
|au		|sahil|mehta|sahil.mehta@capgemini.com|comments|	 |				  |			  |			  |			  |			  |			   |		   |Sales |Permanent|cv.txt	  |0		|This field is required|
|au		|sahil|mehta|sahil.mehta@capgemini.com|comments|	 |				  |Hong Kong  |Darwin	  |Bangkok	  |Mumbai	  |Kuala Lumpur|Auckland   |	  |Permanent|cv.txt	  |0		|This field is required|
|au		|sahil|mehta|sahil.mehta@capgemini.com|comments|	 |				  |Hong Kong  |Darwin	  |Bangkok	  |Mumbai	  |Kuala Lumpur|Auckland   |Sales |		 	|cv.txt	  |0		|This field is required|
|au		|sahil|mehta|sahil.mehta@capgemini.com|comments|	 |				  |Hong Kong  |Darwin	  |Bangkok	  |Mumbai	  |Kuala Lumpur|Auckland   |Sales |Permanent|	   	  |0		|This field is required|
|au		|123@!|mehta|sahil.mehta@capgemini.com|comments|	 |				  |Hong Kong  |Darwin	  |Bangkok	  |Mumbai	  |Kuala Lumpur|Auckland   |Sales |Permanent|cv.txt	  |0		|This field cannot contain numbers or special characters|
|au		|sahil|123@!|sahil.mehta@capgemini.com|comments|	 |				  |Hong Kong  |Darwin	  |Bangkok	  |Mumbai	  |Kuala Lumpur|Auckland   |Sales |Permanent|cv.txt	  |0		|This field cannot contain numbers or special characters|
|au		|sahil|mehta|sahil.mehta			  |comments|	 |				  |Hong Kong  |Darwin	  |Bangkok	  |Mumbai	  |Kuala Lumpur|Auckland   |Sales |Permanent|cv.txt	  |0		|This field is invalid|
|au		|sahil|mehta|sahil.mehta@capgemini.com|comments|	 |				  |Hong Kong  |Darwin	  |Bangkok	  |Mumbai	  |Kuala Lumpur|Auckland   |Sales |Permanent|cv.jpg	  |0		|CV format must be TXT, PDF or DOC|
|au		|sahil|mehta|sahil.mehta@capgemini.com|comments|	 |				  |Hong Kong  |Darwin	  |Bangkok	  |Mumbai	  |Kuala Lumpur|Auckland   |Sales |Permanent|cv500.txt|0		|CV file must not exceed 400KB|
|au		|sahil|mehta|sahil.mehta@capgemini.com|		   |	 |				  |Hong Kong  |Darwin	  |Bangkok	  |Mumbai	  |Kuala Lumpur|Auckland   |Sales |Permanent|cv.txt	  |0		|Thank you for your submission|
|au		|sahil|mehta|sahil.mehta@capgemini.com|comments|	 |				  |Hong Kong  |Darwin	  |Bangkok	  |Mumbai	  |Kuala Lumpur|Auckland   |Sales |Permanent|cv.txt	  |1		|Thank you for your submission|
|au		|sahil|mehta|sahil.mehta@capgemini.com|comments|	 |				  |Hong Kong  |Darwin	  |Bangkok	  |Mumbai	  |Kuala Lumpur|Auckland   |Sales |Permanent|cv.txt	  |0		|Thank you for your submission|
#For Singapore
|sg		|	  |mehta|sahil.mehta@capgemini.com|comments|title|				  |Hong Kong  |Darwin	  |Bangkok	  |Mumbai	  |Kuala Lumpur|Auckland   |Sales |Permanent|cv.txt	  |0		|This field is required|
|sg		|sahil|		|sahil.mehta@capgemini.com|comments|title|				  |Hong Kong  |Darwin	  |Bangkok	  |Mumbai	  |Kuala Lumpur|Auckland   |Sales |Permanent|cv.txt	  |0		|This field is required|
|sg		|sahil|mehta|						  |comments|title|				  |Hong Kong  |Darwin	  |Bangkok	  |Mumbai	  |Kuala Lumpur|Auckland   |Sales |Permanent|cv.txt	  |0		|This field is required|
|sg		|sahil|mehta|sahil.mehta@capgemini.com|comments|	 |				  |Hong Kong  |Darwin	  |Bangkok	  |Mumbai	  |Kuala Lumpur|Auckland   |Sales |Permanent|cv.txt	  |0		|This field is required|
|sg		|sahil|mehta|sahil.mehta@capgemini.com|comments|title|				  |			  |			  |			  |			  |			   |		   |Sales |Permanent|cv.txt	  |0		|This field is required|
|sg		|sahil|mehta|sahil.mehta@capgemini.com|comments|title|				  |Hong Kong  |Darwin	  |Bangkok	  |Mumbai	  |Kuala Lumpur|Auckland   |	  |Permanent|cv.txt	  |0		|This field is required|
|sg		|sahil|mehta|sahil.mehta@capgemini.com|comments|title|				  |Hong Kong  |Darwin	  |Bangkok	  |Mumbai	  |Kuala Lumpur|Auckland   |Sales |		 	|cv.txt	  |0		|This field is required|
|sg		|sahil|mehta|sahil.mehta@capgemini.com|comments|title|				  |Hong Kong  |Darwin	  |Bangkok	  |Mumbai	  |Kuala Lumpur|Auckland   |Sales |Permanent|	   	  |0		|This field is required|
|sg		|123@!|mehta|sahil.mehta@capgemini.com|comments|title|				  |Hong Kong  |Darwin	  |Bangkok	  |Mumbai	  |Kuala Lumpur|Auckland   |Sales |Permanent|cv.txt	  |0		|This field cannot contain numbers or special characters|
|sg		|sahil|123@!|sahil.mehta@capgemini.com|comments|title|				  |Hong Kong  |Darwin	  |Bangkok	  |Mumbai	  |Kuala Lumpur|Auckland   |Sales |Permanent|cv.txt	  |0		|This field cannot contain numbers or special characters|
|sg		|sahil|mehta|sahil.mehta			  |comments|title|				  |Hong Kong  |Darwin	  |Bangkok	  |Mumbai	  |Kuala Lumpur|Auckland   |Sales |Permanent|cv.txt	  |0		|This field is invalid|
|sg		|sahil|mehta|sahil.mehta@capgemini.com|comments|123@!|				  |Hong Kong  |Darwin	  |Bangkok	  |Mumbai	  |Kuala Lumpur|Auckland   |Sales |Permanent|cv.txt	  |0		|This field cannot contain numbers or special characters|
|sg		|sahil|mehta|sahil.mehta@capgemini.com|comments|title|				  |Hong Kong  |Darwin	  |Bangkok	  |Mumbai	  |Kuala Lumpur|Auckland   |Sales |Permanent|cv.jpg	  |0		|CV format must be TXT, PDF or DOC|
|sg		|sahil|mehta|sahil.mehta@capgemini.com|comments|title|				  |Hong Kong  |Darwin	  |Bangkok	  |Mumbai	  |Kuala Lumpur|Auckland   |Sales |Permanent|cv500.txt|0		|CV file must not exceed 400KB|
|sg		|sahil|mehta|sahil.mehta@capgemini.com|		   |title|				  |Hong Kong  |Darwin	  |Bangkok	  |Mumbai	  |Kuala Lumpur|Auckland   |Sales |Permanent|cv.txt	  |0		|Thank you for your submission|
|sg		|sahil|mehta|sahil.mehta@capgemini.com|comments|title|				  |Hong Kong  |Darwin	  |Bangkok	  |Mumbai	  |Kuala Lumpur|Auckland   |Sales |Permanent|cv.txt	  |0		|Thank you for your submission|
#For India
|in		|	  |mehta|sahil.mehta@capgemini.com|comments|title|INR 10 - 20 Lacs|Hong Kong  |Darwin	  |Bangkok	  |Mumbai	  |Kuala Lumpur|Auckland   |Sales |Permanent|cv.txt	  |0		|This field is required|
|in		|sahil|		|sahil.mehta@capgemini.com|comments|title|INR 10 - 20 Lacs|Hong Kong  |Darwin	  |Bangkok	  |Mumbai	  |Kuala Lumpur|Auckland   |Sales |Permanent|cv.txt	  |0		|This field is required|
|in		|sahil|mehta|						  |comments|title|INR 10 - 20 Lacs|Hong Kong  |Darwin	  |Bangkok	  |Mumbai	  |Kuala Lumpur|Auckland   |Sales |Permanent|cv.txt	  |0		|This field is required|
|in		|sahil|mehta|sahil.mehta@capgemini.com|comments|	 |INR 10 - 20 Lacs|Hong Kong  |Darwin	  |Bangkok	  |Mumbai	  |Kuala Lumpur|Auckland   |Sales |Permanent|cv.txt	  |0		|This field is required|
|in		|sahil|mehta|sahil.mehta@capgemini.com|comments|title|				  |Hong Kong  |Darwin	  |Bangkok	  |Mumbai	  |Kuala Lumpur|Auckland   |Sales |Permanent|cv.txt	  |0		|This field is required|
|in		|sahil|mehta|sahil.mehta@capgemini.com|comments|title|INR 10 - 20 Lacs|			  |			  |			  |			  |			   |		   |Sales |Permanent|cv.txt	  |0		|This field is required|
|in		|sahil|mehta|sahil.mehta@capgemini.com|comments|title|INR 10 - 20 Lacs|Hong Kong  |Darwin	  |Bangkok	  |Mumbai	  |Kuala Lumpur|Auckland   |	  |Permanent|cv.txt	  |0		|This field is required|
|in		|sahil|mehta|sahil.mehta@capgemini.com|comments|title|INR 10 - 20 Lacs|Hong Kong  |Darwin	  |Bangkok	  |Mumbai	  |Kuala Lumpur|Auckland   |Sales |		 	|cv.txt	  |0		|This field is required|
|in		|sahil|mehta|sahil.mehta@capgemini.com|comments|title|INR 10 - 20 Lacs|Hong Kong  |Darwin	  |Bangkok	  |Mumbai	  |Kuala Lumpur|Auckland   |Sales |Permanent|	   	  |0		|This field is required|
|in		|123@!|mehta|sahil.mehta@capgemini.com|comments|title|INR 10 - 20 Lacs|Hong Kong  |Darwin	  |Bangkok	  |Mumbai	  |Kuala Lumpur|Auckland   |Sales |Permanent|cv.txt	  |0		|This field cannot contain numbers or special characters|
|in		|sahil|123@!|sahil.mehta@capgemini.com|comments|title|INR 10 - 20 Lacs|Hong Kong  |Darwin	  |Bangkok	  |Mumbai	  |Kuala Lumpur|Auckland   |Sales |Permanent|cv.txt	  |0		|This field cannot contain numbers or special characters|
|in		|sahil|mehta|sahil.mehta			  |comments|title|INR 10 - 20 Lacs|Hong Kong  |Darwin	  |Bangkok	  |Mumbai	  |Kuala Lumpur|Auckland   |Sales |Permanent|cv.txt	  |0		|This field is invalid|
|in		|sahil|mehta|sahil.mehta@capgemini.com|comments|123@!|INR 10 - 20 Lacs|Hong Kong  |Darwin	  |Bangkok	  |Mumbai	  |Kuala Lumpur|Auckland   |Sales |Permanent|cv.txt	  |0		|This field cannot contain numbers or special characters|
|in		|sahil|mehta|sahil.mehta@capgemini.com|comments|title|INR 10 - 20 Lacs|Hong Kong  |Darwin	  |Bangkok	  |Mumbai	  |Kuala Lumpur|Auckland   |Sales |Permanent|cv.jpg	  |0		|CV format must be TXT, PDF or DOC|
|in		|sahil|mehta|sahil.mehta@capgemini.com|comments|title|INR 10 - 20 Lacs|Hong Kong  |Darwin	  |Bangkok	  |Mumbai	  |Kuala Lumpur|Auckland   |Sales |Permanent|cv500.txt|0		|CV file must not exceed 400KB|
|in		|sahil|mehta|sahil.mehta@capgemini.com|		   |title|INR 10 - 20 Lacs|Hong Kong  |Darwin	  |Bangkok	  |Mumbai	  |Kuala Lumpur|Auckland   |Sales |Permanent|cv.txt	  |0		|Thank you for your submission|
|in		|sahil|mehta|sahil.mehta@capgemini.com|comments|title|INR 10 - 20 Lacs|Hong Kong  |Darwin	  |Bangkok	  |Mumbai	  |Kuala Lumpur|Auckland   |Sales |Permanent|cv.txt	  |0		|Thank you for your submission|
#For Malaysia
|my		|	  |mehta|sahil.mehta@capgemini.com|comments|	 |				  |Hong Kong  |Darwin	  |Bangkok	  |Mumbai	  |Kuala Lumpur|Auckland   |Sales |Permanent|cv.txt	  |0		|This field is required|
|my		|sahil|		|sahil.mehta@capgemini.com|comments|	 |				  |Hong Kong  |Darwin	  |Bangkok	  |Mumbai	  |Kuala Lumpur|Auckland   |Sales |Permanent|cv.txt	  |0		|This field is required|
|my		|sahil|mehta|						  |comments|	 |				  |Hong Kong  |Darwin	  |Bangkok	  |Mumbai	  |Kuala Lumpur|Auckland   |Sales |Permanent|cv.txt	  |0		|This field is required|
|my		|sahil|mehta|sahil.mehta@capgemini.com|comments|	 |				  |			  |			  |			  |			  |			   |		   |Sales |Permanent|cv.txt	  |0		|This field is required|
|my		|sahil|mehta|sahil.mehta@capgemini.com|comments|	 |				  |Hong Kong  |Darwin	  |Bangkok	  |Mumbai	  |Kuala Lumpur|Auckland   |	  |Permanent|cv.txt	  |0		|This field is required|
|my		|sahil|mehta|sahil.mehta@capgemini.com|comments|	 |				  |Hong Kong  |Darwin	  |Bangkok	  |Mumbai	  |Kuala Lumpur|Auckland   |Sales |		 	|cv.txt	  |0		|This field is required|
|my		|sahil|mehta|sahil.mehta@capgemini.com|comments|	 |				  |Hong Kong  |Darwin	  |Bangkok	  |Mumbai	  |Kuala Lumpur|Auckland   |Sales |Permanent|	   	  |0		|This field is required|
|my		|123@!|mehta|sahil.mehta@capgemini.com|comments|	 |				  |Hong Kong  |Darwin	  |Bangkok	  |Mumbai	  |Kuala Lumpur|Auckland   |Sales |Permanent|cv.txt	  |0		|This field cannot contain numbers or special characters|
|my		|sahil|123@!|sahil.mehta@capgemini.com|comments|	 |				  |Hong Kong  |Darwin	  |Bangkok	  |Mumbai	  |Kuala Lumpur|Auckland   |Sales |Permanent|cv.txt	  |0		|This field cannot contain numbers or special characters|
|my		|sahil|mehta|sahil.mehta			  |comments|	 |				  |Hong Kong  |Darwin	  |Bangkok	  |Mumbai	  |Kuala Lumpur|Auckland   |Sales |Permanent|cv.txt	  |0		|This field is invalid|
|my		|sahil|mehta|sahil.mehta@capgemini.com|comments|	 |				  |Hong Kong  |Darwin	  |Bangkok	  |Mumbai	  |Kuala Lumpur|Auckland   |Sales |Permanent|cv.jpg	  |0		|CV format must be TXT, PDF or DOC|
|my		|sahil|mehta|sahil.mehta@capgemini.com|comments|	 |				  |Hong Kong  |Darwin	  |Bangkok	  |Mumbai	  |Kuala Lumpur|Auckland   |Sales |Permanent|cv500.txt|0		|CV file must not exceed 400KB|
|my		|sahil|mehta|sahil.mehta@capgemini.com|		   |	 |				  |Hong Kong  |Darwin	  |Bangkok	  |Mumbai	  |Kuala Lumpur|Auckland   |Sales |Permanent|cv.txt	  |0		|Thank you for your submission|
|my		|sahil|mehta|sahil.mehta@capgemini.com|comments|	 |				  |Hong Kong  |Darwin	  |Bangkok	  |Mumbai	  |Kuala Lumpur|Auckland   |Sales |Permanent|cv.txt	  |0		|Thank you for your submission|
#For New Zealand
|nz		|	  |mehta|sahil.mehta@capgemini.com|comments|	 |				  |Hong Kong  |Darwin	  |Bangkok	  |Mumbai	  |Kuala Lumpur|Auckland   |Sales |Permanent|cv.txt	  |0		|This field is required|
|nz		|sahil|		|sahil.mehta@capgemini.com|comments|	 |				  |Hong Kong  |Darwin	  |Bangkok	  |Mumbai	  |Kuala Lumpur|Auckland   |Sales |Permanent|cv.txt	  |0		|This field is required|
|nz		|sahil|mehta|						  |comments|	 |				  |Hong Kong  |Darwin	  |Bangkok	  |Mumbai	  |Kuala Lumpur|Auckland   |Sales |Permanent|cv.txt	  |0		|This field is required|
|nz		|sahil|mehta|sahil.mehta@capgemini.com|comments|	 |				  |			  |			  |			  |			  |			   |		   |Sales |Permanent|cv.txt	  |0		|This field is required|
|nz		|sahil|mehta|sahil.mehta@capgemini.com|comments|	 |				  |Hong Kong  |Darwin	  |Bangkok	  |Mumbai	  |Kuala Lumpur|Auckland   |	  |Permanent|cv.txt	  |0		|This field is required|
|nz		|sahil|mehta|sahil.mehta@capgemini.com|comments|	 |				  |Hong Kong  |Darwin	  |Bangkok	  |Mumbai	  |Kuala Lumpur|Auckland   |Sales |		 	|cv.txt	  |0		|This field is required|
|nz		|sahil|mehta|sahil.mehta@capgemini.com|comments|	 |				  |Hong Kong  |Darwin	  |Bangkok	  |Mumbai	  |Kuala Lumpur|Auckland   |Sales |Permanent|	   	  |0		|This field is required|
|nz		|123@!|mehta|sahil.mehta@capgemini.com|comments|	 |				  |Hong Kong  |Darwin	  |Bangkok	  |Mumbai	  |Kuala Lumpur|Auckland   |Sales |Permanent|cv.txt	  |0		|This field cannot contain numbers or special characters|
|nz		|sahil|123@!|sahil.mehta@capgemini.com|comments|	 |				  |Hong Kong  |Darwin	  |Bangkok	  |Mumbai	  |Kuala Lumpur|Auckland   |Sales |Permanent|cv.txt	  |0		|This field cannot contain numbers or special characters|
|nz		|sahil|mehta|sahil.mehta			  |comments|	 |				  |Hong Kong  |Darwin	  |Bangkok	  |Mumbai	  |Kuala Lumpur|Auckland   |Sales |Permanent|cv.txt	  |0		|This field is invalid|
|nz		|sahil|mehta|sahil.mehta@capgemini.com|comments|	 |				  |Hong Kong  |Darwin	  |Bangkok	  |Mumbai	  |Kuala Lumpur|Auckland   |Sales |Permanent|cv.jpg	  |0		|CV format must be TXT, PDF or DOC|
|nz		|sahil|mehta|sahil.mehta@capgemini.com|comments|	 |				  |Hong Kong  |Darwin	  |Bangkok	  |Mumbai	  |Kuala Lumpur|Auckland   |Sales |Permanent|cv500.txt|0		|CV file must not exceed 400KB|
|nz		|sahil|mehta|sahil.mehta@capgemini.com|		   |	 |				  |Hong Kong  |Darwin	  |Bangkok	  |Mumbai	  |Kuala Lumpur|Auckland   |Sales |Permanent|cv.txt	  |0		|Thank you for your submission|
|nz		|sahil|mehta|sahil.mehta@capgemini.com|comments|	 |				  |Hong Kong  |Darwin	  |Bangkok	  |Mumbai	  |Kuala Lumpur|Auckland   |Sales |Permanent|cv.txt	  |0		|Thank you for your submission|