Feature: Rendering patterns

  Scenario: Render an Atom
    Given the Server is running at "basic-patterns-app"
    When I go to "/atom"
    Then I should see "basic atom"

  Scenario: Render a Molecule
    Given the Server is running at "basic-patterns-app"
    When I go to "/molecule"
    Then I should see "basic molecule"

  Scenario: Render an Organism
    Given the Server is running at "basic-patterns-app"
    When I go to "/organism"
    Then I should see "basic organism"

  Scenario: Render a Template
    Given the Server is running at "basic-patterns-app"
    When I go to "/template"
    Then I should see "basic template"
