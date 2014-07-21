@searchlogin @new
Feature: Search functionality using keyword along with Save Search and Create Job Alert for logged in user

@javascript
Scenario Outline: Searching for jobs using keyword view and performing all filters along with Save Search and Create job Alert for the search for logged in user
Precondition -> The email address provided below should be registered with the password
Given I maximise the window
And I go to "<pagesite>" mypage with env "" and country "<country>"
And I login with "lavin.malkani@capgemini.com" and "testtest"
And I wait 2 seconds
And I go to "<pagesite>" with env "" and country "<country>"
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
#|au		|michaelpage  |
#|sg		|michaelpage  |
#|in		|michaelpage  |
#|my		|michaelpage  |
#|nz		|michaelpage  |