@spec @new
Feature: Submit job spec form

@javascript
Scenario Outline: Test for Submit job spec
Given I maximise the window
And I go to "pagepersonnel" with env "" and country "<country>"
And I wait 5 seconds
When I click "Submit a job spec" on "footer"
And I wait 5 seconds
Then I should see "Submit a job spec"
And I check url "submit-job-spec"
And I wait 5 seconds
When I fill "submit-job-spec" form for country "<country>" and parameters "<name>,<company>,<email>,<telephone>,<location_hk>,<location_au>,<location_sg>,<location_in>,<location_my>,<location_nz>,<sector>,<input7>"
And I wait 5 seconds
And I click "Submit" on "form"
And I wait 5 seconds
Then I should see "<output1>"

Examples:
|country|name |company|email					|telephone|location_hk|location_au|location_sg|location_in|location_my |location_nz|sector	  |input7|output1|
#For PP HongKong
|hk		|	  |CG	  |sahil.mehta@capgemini.com|12345	  |Hong Kong  |Darwin	  |Bangkok	  |Mumbai	  |Kuala Lumpur|Auckland   |Marketing |		 |This field is required|
|hk		|sahil|		  |sahil.mehta@capgemini.com|12345	  |Hong Kong  |Darwin	  |Bangkok	  |Mumbai	  |Kuala Lumpur|Auckland   |Marketing |		 |This field is required|
|hk		|sahil|CG	  |							|12345	  |Hong Kong  |Darwin	  |Bangkok	  |Mumbai	  |Kuala Lumpur|Auckland   |Marketing |		 |This field is required|
|hk		|sahil|CG	  |sahil.mehta			  	|12345	  |Hong Kong  |Darwin	  |Bangkok	  |Mumbai	  |Kuala Lumpur|Auckland   |Marketing |		 |This field is invalid|
|hk		|sahil|CG	  |sahil.mehta@capgemini.com|		  |Hong Kong  |Darwin	  |Bangkok	  |Mumbai	  |Kuala Lumpur|Auckland   |Marketing |		 |This field is required|
|hk		|sahil|CG	  |sahil.mehta@capgemini.com|12av5	  |Hong Kong  |Darwin	  |Bangkok	  |Mumbai	  |Kuala Lumpur|Auckland   |Marketing |		 |Field is numeric|
|hk		|sahil|CG	  |sahil.mehta@capgemini.com|12345	  |			  |			  |			  |			  |			   |		   |Marketing |		 |This field is required|
|hk		|sahil|CG	  |sahil.mehta@capgemini.com|12345	  |Hong Kong  |Darwin	  |Bangkok	  |Mumbai	  |Kuala Lumpur|Auckland   |Marketing |		 |Job spec upload|
|hk		|sahil|CG	  |sahil.mehta@capgemini.com|12345	  |Hong Kong  |Darwin	  |Bangkok	  |Mumbai	  |Kuala Lumpur|Auckland   |		  |		 |This field is required|
|hk		|sahil|CG	  |sahil.mehta@capgemini.com|12345	  |Hong Kong  |Darwin	  |Bangkok	  |Mumbai	  |Kuala Lumpur|Auckland   |Marketing |cv.txt|Job spec upload|