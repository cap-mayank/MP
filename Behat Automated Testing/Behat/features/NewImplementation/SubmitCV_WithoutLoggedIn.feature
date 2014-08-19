@submitcv @logout @new 
Feature: To test Submit CV without logged in

@javascript
Scenario Outline: Test for all scenarios while Submitting CV when user is not logged in
Given I maximise the window
And I go to "<pagesite>" with env "uat" and country "<country>"
And I wait 5 seconds
When I click "Submit your CV" on "sliders"
And I wait 3 seconds
When I fill "Submit CV" form for country "<country>" and parameters "<fname>,<lname>,<email>,<comments>,<title>,<salary_in>,<location_hk>,<location_au>,<location_sg>,<location_in>,<location_my>,<location_nz>,<location_uk>,<sector>,<jobtype>,<cv>,<checkbox>"
And I wait 6 seconds
And I click the button "Submit"
And I wait 5 seconds
Then I should see "<output>"

Examples:
|country|pagesite     |fname|lname|email					|comments|title |salary_in		 |location_hk|location_au |location_sg|location_in|location_my |location_nz|location_uk|sector|jobtype	|cv	   	  |checkbox	|output|
#For PP United Kingdom
|uk		|pagepersonnel|	  	|mehta|sahil.mehta@capgemini.com|comments|		|				 |Hong Kong  |Darwin	  |Bangkok	  |Mumbai	  |Kuala Lumpur|Auckland   |Boldon	   |Sales |Permanent|cv.txt	  |0		|This field is required|
|uk		|pagepersonnel|sahil|	  |sahil.mehta@capgemini.com|comments|		|				 |Hong Kong  |Darwin	  |Bangkok	  |Mumbai	  |Kuala Lumpur|Auckland   |Boldon	   |Sales |Permanent|cv.txt	  |0		|This field is required|
|uk		|pagepersonnel|sahil|mehta|						  	|comments|	 	|				 |Hong Kong  |Darwin	  |Bangkok	  |Mumbai	  |Kuala Lumpur|Auckland   |Boldon	   |Sales |Permanent|cv.txt	  |0		|This field is required|
|uk		|pagepersonnel|sahil|mehta|sahil.mehta@capgemini.com|comments|	 	|				 |			 |			  |			  |			  |			   |		   |		   |Sales |Permanent|cv.txt	  |0		|This field is required|
|uk		|pagepersonnel|sahil|mehta|sahil.mehta@capgemini.com|comments|	 	|				 |Hong Kong  |Darwin	  |Bangkok	  |Mumbai	  |Kuala Lumpur|Auckland   |Boldon	   |	  |Permanent|cv.txt	  |0		|This field is required|
|uk		|pagepersonnel|sahil|mehta|sahil.mehta@capgemini.com|comments|	 	|				 |Hong Kong  |Darwin	  |Bangkok	  |Mumbai	  |Kuala Lumpur|Auckland   |Boldon	   |Sales |		 	|cv.txt	  |0		|This field is required|
|uk		|pagepersonnel|sahil|mehta|sahil.mehta@capgemini.com|comments|	 	|				 |Hong Kong  |Darwin	  |Bangkok	  |Mumbai	  |Kuala Lumpur|Auckland   |Boldon	   |Sales |Permanent|	   	  |0		|This field is required|
|uk		|pagepersonnel|123@!|mehta|sahil.mehta@capgemini.com|comments|	 	|				 |Hong Kong  |Darwin	  |Bangkok	  |Mumbai	  |Kuala Lumpur|Auckland   |Boldon	   |Sales |Permanent|cv.txt	  |0		|This field cannot contain numbers or special characters|
|uk		|pagepersonnel|sahil|123@!|sahil.mehta@capgemini.com|comments|	 	|				 |Hong Kong  |Darwin	  |Bangkok	  |Mumbai	  |Kuala Lumpur|Auckland   |Boldon	   |Sales |Permanent|cv.txt	  |0		|This field cannot contain numbers or special characters|
|uk		|pagepersonnel|sahil|mehta|sahil.mehta			  	|comments|	 	|				 |Hong Kong  |Darwin	  |Bangkok	  |Mumbai	  |Kuala Lumpur|Auckland   |Boldon	   |Sales |Permanent|cv.txt	  |0		|This field is invalid|
#|uk		|pagepersonnel|sahil|mehta|sahil.mehta@capgemini.com|comments|	 	|				 |Hong Kong  |Darwin	  |Bangkok	  |Mumbai	  |Kuala Lumpur|Auckland   |Boldon	   |Sales |Permanent|cv.jpg	  |0		|CV format must be TXT, PDF or DOC|
#|uk		|pagepersonnel|sahil|mehta|sahil.mehta@capgemini.com|comments|	 	|				 |Hong Kong  |Darwin	  |Bangkok	  |Mumbai	  |Kuala Lumpur|Auckland   |Boldon	   |Sales |Permanent|cv500.txt|0		|CV file must not exceed 400KB|
|uk		|pagepersonnel|sahil|mehta|sahil.mehta@capgemini.com|		 |	 	|				 |Hong Kong  |Darwin	  |Bangkok	  |Mumbai	  |Kuala Lumpur|Auckland   |Boldon	   |Sales |Permanent|cv.txt	  |0		|Thank you for your submission|
|uk		|pagepersonnel|sahil|mehta|sahil.mehta@capgemini.com|comments|	 	|				 |Hong Kong  |Darwin	  |Bangkok	  |Mumbai	  |Kuala Lumpur|Auckland   |Boldon	   |Sales |Permanent|cv.txt	  |0		|Thank you for your submission|