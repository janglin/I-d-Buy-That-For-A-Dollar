Feature:  All deals feature

  Background:
    Given I would like to see all deals available to me in "South Bend, IN"

  Scenario: Viewing all of my deals in a city
    When all of the available deals have been displayed
    Then I should have a good idea on how to save some serious cash

  Scenario: Choosing what I like about a deal
    When I am observing the categories for the "Eagle Aircraft" deal
    Then I have the option to express that I like deals about:
      | Category           |
      | Date Night         |
      | Cultural Pursuits  |
      | Once in a Lifetime |
