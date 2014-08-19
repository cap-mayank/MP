@request
Feature: Request a call back form

@javascript
Scenario Outline: Test for Request a call back
Given I maximise the window
And I go to "<pagesite>" with env "uat" and country "<country>"
And I wait 5 seconds
When I click "Request a call back" on "footer"
And I wait 5 seconds
Then I should see "Request a call back"
And I check url "request-call-back"
And I wait 5 seconds
When I fill "request-call-back" form for country "<country>" and parameters "<name>,<job_title>,<organisation>,<telephone>,<email>,<sector>,<location_hk>,<location_au>,<location_sg>,<location_in>,<location_my>,<location_nz>,<location_uk>,<location_us>,<message>"
And I wait 5 seconds
And I click "Submit" on "form"
And I wait 5 seconds
Then I should see "<output1>"

Examples:
#For For PP UK
|country|pagesite		|name |job_title  |organisation    |telephone | email					|sector    |location_hk|location_au|location_sg|location_in|location_my |location_nz|location_us|location_uk  |message |output1|
|uk		|pagepersonnel	|	  |Manager	  |CG              |12345     |sahil.mehta@capgemini.com|Sales     |Hong Kong  |Darwin	   |Bangkok	   |Mumbai	   |Kuala Lumpur|Auckland   |Sydney     |Bristol      |Consider|This field is required|
|uk		|pagepersonnel	|sahil|		      |CG              |12345     |sahil.mehta@capgemini.com|Sales     |Hong Kong  |Darwin	   |Bangkok	   |Mumbai	   |Kuala Lumpur|Auckland   |Sydney     |Bristol      |Consider|This field is required|
|uk		|pagepersonnel	|sahil|Manager	  |CG              |12345	  |						    |Sales     |Hong Kong  |Darwin	   |Bangkok	   |Mumbai	   |Kuala Lumpur|Auckland   |Sydney     |Bristol      |Consider|This field is required|
|uk		|pagepersonnel	|sahil|Manager	  |CG              |12345     |sahil.mehta			  	|Sales     |Hong Kong  |Darwin	   |Bangkok	   |Mumbai	   |Kuala Lumpur|Auckland   |Sydney     |Bristol      |Consider|This field is invalid|
|uk		|pagepersonnel  |sahil|Manager	  |CG              |          |sahil.mehta@capgemini.com|Sales     |Hong Kong  |Darwin	   |Bangkok	   |Mumbai	   |Kuala Lumpur|Auckland   |Sydney     |Bristol      |Consider|This field is required|
|uk		|pagepersonnel	|sahil|Manager	  |CG              |12av5     |sahil.mehta@capgemini.com|Sales     |Hong Kong  |Darwin	   |Bangkok	   |Mumbai	   |Kuala Lumpur|Auckland   |Sydney     |Bristol      |Consider|Field is numeric|
|uk		|pagepersonnel	|sahil|Manager	  |CG              |12345     |sahil.mehta@capgemini.com|Sales     |		   |		   |		   |		   |			|		    |           |		      |Consider|This field is required|
|uk		|pagepersonnel	|sahil|Manager	  |CG              |12345     |sahil.mehta@capgemini.com|Sales     |Hong Kong  |Darwin	   |Bangkok	   |Mumbai	   |Kuala Lumpur|Auckland   |Sydney     |Bristol      |        |Thank you Request a call back|
|uk		|pagepersonnel	|sahil|Manager	  |CG              |12345     |sahil.mehta@capgemini.com|          |Hong Kong  |Darwin	   |Bangkok	   |Mumbai	   |Kuala Lumpur|Auckland   |	        |Bristol      |Consider|This field is required|
|uk		|pagepersonnel	|sahil|Manager	  |CG              |12345     |sahil.mehta@capgemini.com|Sales     |Hong Kong  |Darwin	   |Bangkok	   |Mumbai	   |Kuala Lumpur|Auckland   |Sydney     |Bristol      |Consider|Thank you Request a call back|
|uk		|pagepersonnel	|sahil|Manager	  |                |12345     |sahil.mehta@capgemini.com|Sales     |Hong Kong  |Darwin	   |Bangkok	  | Mumbai	   |Kuala Lumpur|Auckland   |Sydney     |Bristol      |Consider|This field is required|
 
