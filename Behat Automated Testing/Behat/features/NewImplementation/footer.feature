@footer @new @PPGoLive
Feature: Footer Links

@javascript
Scenario Outline: Click on footer links and verify the landing page
Given I maximise the window
And I go to "<pagesite>" with env "" and country "<country>"
And I wait 5 seconds
When I click "<links>" on "footer"
And I wait 5 seconds
Then I should see "<result>"
And I check url "<url>"

Examples:
|country|pagesite	  |links 					 	 |result					  	|url|
#For PP Hong Kong
	#-> Our Expertise
|hk		|pagepersonnel|Finance & Accounting		   	 |Finance & Accounting		   	|finance-accounting|
|hk		|pagepersonnel|Financial Services & Banking	 |Financial Services & Banking	|financial-services-banking|
|hk		|pagepersonnel|Marketing				   	 |Marketing				   	 	|marketing|
|hk		|pagepersonnel|Sales					   	 |Sales					   	 	|sales|
|hk		|pagepersonnel|Secretarial & Business Support|Secretarial & Business Support|secretarial-business-support|
	#-> Other Footer links
|hk		|pagepersonnel|Email Disclaimer			   	 |Email Disclaimer				|email-disclaimer|
|hk		|pagepersonnel|Site map					   	 |Site map						|site-map|
|hk		|pagepersonnel|Site terms				   	 |Site terms				  	|site-terms|
|hk		|pagepersonnel|Privacy policy			   	 |Privacy policy			  	|privacy-policy|
|hk		|pagepersonnel|Cookies Policy			   	 |Cookie Policy			  		|cookies-policy|
|hk		|pagepersonnel|Insight					   	 |Employer Resource Centre 		|employer-centre|