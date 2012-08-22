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
    When I navigate to campaigns section
    Then I should see the list of existing campaigns

  @javascript
  Scenario: User creates new campaign
    Given brand exists with name: "Dell", id: 1
    And no campaigns exist
    And I am on the new campaign page
    When I submit new campaign form with valid data
    Then the campaign should exist with brand_id: 1

  @javascript
  Scenario: User deletes campaign
    Given a campaign exist with brand_id: "1"
    And I am on the home page
    When I navigate to campaigns section
    And I delete campaign
    Then I should see flash "Campaign has been deleted!"
    And no campaigns should exist
