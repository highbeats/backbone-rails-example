Feature: Campaigns
  In order to control barnds campaigns organization
  As a user
  I want to manage campaigns

  @javascript
  Scenario: User lists campaigns
    Given the following campaigns exist
      | brand_id | start_from_date | end_date   |
      | 1        | 20/08/2012      | 25/08/2012 |
      | 1        | 24/09/2012      | 30/09/2012 |
    And I am on the home page
    When I go to campaigns index
    Then I should see the list of all campaigns

  @javascript
  Scenario: User creates new campaign
    Given I am on the new campaign page
    And I fill new campaign with valid data
    When I click "Save"
    Then I should see alert "Success!"
    And a campaign should exist
