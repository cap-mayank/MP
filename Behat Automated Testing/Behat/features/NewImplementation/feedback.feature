@feedback
Feature: Feedback form

@javascript
Scenario Outline: Test for Feedback form
Given I maximise the window
And I go to "<pagesite>" with env "uat" and country "<country>"
And I wait 5 seconds
When I click "Feedback" on "footer"
And I wait 5 seconds
Then I should see "Feedback"
And I check url "submit-feedback"
And I wait 5 seconds
When I fill "submit-feedback" form for country "<country>" and parameters "<name>,<email>,<Complaint_subject>,<Comments>"
And I wait 5 seconds
And I click "Submit" on "form"
And I wait 5 seconds
Then I should see "<output1>"

Examples:
|country|pagesite		|name  |email                            |Complaint_subject  |Comments   |output1|
#For PP UK
|uk		|pagepersonnel	|      |aniket.kharade@capgemini.com     |Customer feedback  |Excellent  |This field is required|
|uk		|pagepersonnel	|aniket|                                 |Customer feedback  |Excellent  |This field is required|
|uk		|pagepersonnel	|aniket|aniket.kharade                   |Customer feedback  |Excellent  |This field is invalid|
|uk		|pagepersonnel	|aniket|aniket.kharade@capgemini.com     |                   |Excellent  |This field is required|
|uk		|pagepersonnel	|aniket|aniket.kharade@capgemini.com     |Customer feedback  |           |This field is required|
|uk		|pagepersonnel	|aniket|aniket.kharade@capgemini.com     |Customer feedback  |Excellent  |Thank you for your feedback|


