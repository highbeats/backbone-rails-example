Feature: Comapnies management
  In order to perform activity on behalf of a company
  As a representative
  I want to be able to manage companies

  @javascript
  Scenario: User lists companies
    Given the following companies exist
      | name | address           | phone |
      | cmp1 | 99201 Hhh str. 12 | 12345 |
      | cmp2 | 9923 Hhr str. 12  | 12335 |
    And I am on the home page
    When I navigate to companies section
    Then I should see the list of existing companies

  @javascript
  Scenario: User creates company with valid data
    Given no companies exist
    And I am on the new company page
    When I submit new company form with valid data
    Then company should exist with name: "TestName"

  @javascript
  Scenario: User deletes company
    Given 
