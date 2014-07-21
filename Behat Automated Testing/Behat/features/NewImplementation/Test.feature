@testnew @new
Feature: To test search functionality using keyword view along with Save Search and Create job Alert

@javascript
Scenario Outline: Searching for jobs using keyword view and performing all filters along with Save Search and Create job Alert for the search for logged in user
Precondition -> The email address provided below should be registered with the password
Given I maximise the window
And I go to "michaelpage" with env "uat" and country "<country>"
And I wait 5 seconds
And I search jobs with Keywords "sales" and also filtering the search with salary location sector and sub-sector filters
And I wait 2 seconds
Then I verify and validate the saved search and job alert created

Examples:
|country|
|my		|
|au		|