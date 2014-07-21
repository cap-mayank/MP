@search @new
Feature: Search functionality using keyword along with Save Search and Create Job Alert for not logged in user

@javascript
Scenario Outline: Searching for jobs using keyword view and performing all filters along with Save Search and Create job Alert for the search
User is not logged in
Given I maximise the window
And I go to "<pagesite>" with env "" and country "<country>"
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
|country|pagesite	  |
|hk		|pagepersonnel |
#|au		|michaelpage  |
#|sg		|michaelpage  |
#|in		|michaelpage  |
#|my		|michaelpage  |
#|nz		|michaelpage  |