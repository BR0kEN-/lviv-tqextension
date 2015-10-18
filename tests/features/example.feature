@api @d7 @javascript
Feature: TqExtension examples
  @uli
  Scenario: Drush ULI
    Given I login with one time link (admin)

  Scenario: Hierarchical selects
    Given I login with one time link (admin)
    Then I am on the "node/add/example" page
    And I select the following in "HS" hierarchical select:
      | Term 1 |
      | Term 5 |
      | Term 8 |
      | Term 9 |
    And I select the following in "SHS" hierarchical select:
      | Term 1 |
      | Term 5 |
      | Term 8 |
      | Term 9 |
    And I select the following in "CSHS" hierarchical select:
      | Term 1 |
      | Term 5 |
      | Term 8 |
      | Term 9 |
