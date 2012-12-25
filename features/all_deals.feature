Feature:  All deals feature

  Background:
    Given I would like to see all deals available to me in "South Bend, IN"

  Scenario: Viewing all of my deals in a city
    When all of the available deals have been displayed
    Then I should have a good idea on how to save some serious cash

  Scenario: Knowing what categories a deal falls under
    When I am observing the categories for the "Eagle Aircraft" deal
    Then I have the option to express that I like deals about:
      | Category           |
      | Date Night         |
      | Cultural Pursuits  |
      | Once in a Lifetime |

  Scenario: Personally categorizing deals
    When I categorize "Jiffy Lube of Indiana" as "New Car Smell"
    Then then next time my deal knows that I like "New Car Smell" about it

  Scenario: Hiding deals that we are not interested in
    When I have no interested in "Omaha Steaks, Salon Ubon, Aluminyze"
    Then the deals I think are not interesting will be remembered
