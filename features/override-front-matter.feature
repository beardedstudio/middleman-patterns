Feature: Front-matter can be overridden when invoking patterns

  Scenario: Render an Atom with front-matter
    Given the Server is running at "patterns-with-data-app"
    When I go to "/overrides/atom"
    Then I should see "Overridden Atom"

  Scenario: Render a Molecule with front-matter
    Given the Server is running at "patterns-with-data-app"
    When I go to "/overrides/molecule"
    Then I should see "Overridden Molecule"

  Scenario: Render an Organism with front-matter
    Given the Server is running at "patterns-with-data-app"
    When I go to "/overrides/organism"
    Then I should see "Overridden Organism"

  Scenario: Render a Template with front-matter
    Given the Server is running at "patterns-with-data-app"
    When I go to "/overrides/template"
    Then I should see "Overridden Template"
