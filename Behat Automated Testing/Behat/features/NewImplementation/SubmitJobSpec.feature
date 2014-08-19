@spec @new @SITALL @runnow
Feature: Submit job spec form

@javascript
Scenario Outline: Test for Submit job spec
Given I maximise the window
And I go to "<pagesite>" with env "uat" and country "<country>"
And I wait 5 seconds
When I click "Submit a job spec" on "footer"
And I wait 5 seconds
Then I should see "Submit a job spec"
And I check url "submit-job-spec"
And I wait 5 seconds
When I fill "submit-job-spec" form for country "<country>" and parameters "<name>,<company>,<email>,<telephone>,<location_hk>,<location_au>,<location_sg>,<location_in>,<location_my>,<location_nz>,<location_uk>,<sector>,<input7>"
And I wait 5 seconds
And I click "Submit" on "form"
And I wait 5 seconds
Then I should see "<output1>"

Examples:
|country|pagesite		|name |company|email					|telephone|location_hk|location_au|location_sg|location_in|location_my |location_nz|location_uk|sector|input7|output1|
#For PP UK
|uk		|pagepersonnel	|	  |CG	  |sahil.mehta@capgemini.com|12345	  |Hong Kong  |Darwin	  |Bangkok	  |Mumbai	  |Kuala Lumpur|Auckland   |Bristol    |Sales |		 |This field is required|
|uk		|pagepersonnel	|sahil|		  |sahil.mehta@capgemini.com|12345	  |Hong Kong  |Darwin	  |Bangkok	  |Mumbai	  |Kuala Lumpur|Auckland   |Bristol    |Sales |		 |This field is required|
|uk		|pagepersonnel	|sahil|CG	  |							|12345	  |Hong Kong  |Darwin	  |Bangkok	  |Mumbai	  |Kuala Lumpur|Auckland   |Bristol    |Sales |		 |This field is required|
|uk		|pagepersonnel	|sahil|CG	  |sahil.mehta			  	|12345	  |Hong Kong  |Darwin	  |Bangkok	  |Mumbai	  |Kuala Lumpur|Auckland   |Bristol    |Sales |		 |This field is invalid|
|uk		|pagepersonnel	|sahil|CG	  |sahil.mehta@capgemini.com|		  |Hong Kong  |Darwin	  |Bangkok	  |Mumbai	  |Kuala Lumpur|Auckland   |Bristol    |Sales |		 |This field is required|
|uk		|pagepersonnel	|sahil|CG	  |sahil.mehta@capgemini.com|12av5	  |Hong Kong  |Darwin	  |Bangkok	  |Mumbai	  |Kuala Lumpur|Auckland   |Bristol    |Sales |		 |Field is numeric|
|uk		|pagepersonnel	|sahil|CG	  |sahil.mehta@capgemini.com|12345	  |			  |			  |			  |			  |			   |		   |           |Sales |		 |This field is required|
|uk		|pagepersonnel	|sahil|CG	  |sahil.mehta@capgemini.com|12345	  |Hong Kong  |Darwin	  |Bangkok	  |Mumbai	  |Kuala Lumpur|Auckland   |Bristol    |Sales |		 |Job spec upload|
|uk		|pagepersonnel	|sahil|CG	  |sahil.mehta@capgemini.com|12345	  |Hong Kong  |Darwin	  |Bangkok	  |Mumbai	  |Kuala Lumpur|Auckland   |Bristol	   |      |		 |This field is required|
|uk		|pagepersonnel	|sahil|CG	  |sahil.mehta@capgemini.com|12345	  |Hong Kong  |Darwin	  |Bangkok	  |Mumbai	  |Kuala Lumpur|Auckland   |Bristol    |Sales |cv.txt|Job spec upload|
