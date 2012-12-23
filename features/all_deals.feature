Feature:  All deals feature

  Scenario: Viewing all of my deals in a city
    Given I would like to see all deals available to me in "South Bend, IN"
    When all of the available deals have been displayed
    Then I should have a good idea on how to save some serious cash