Feature: Front-matter can be used in patterns

  Scenario: Render an Atom with front-matter
    Given the Server is running at "patterns-with-data-app"
    When I go to "/basic/atom"
    Then I should see "Default Atom"

  Scenario: Render a Molecule with front-matter
    Given the Server is running at "patterns-with-data-app"
    When I go to "/basic/molecule"
    Then I should see "Default Molecule"

  Scenario: Render an Organism with front-matter
    Given the Server is running at "patterns-with-data-app"
    When I go to "/basic/organism"
    Then I should see "Default Organism"

  Scenario: Render a Template with front-matter
    Given the Server is running at "patterns-with-data-app"
    When I go to "/basic/template"
    Then I should see "Default Template"
