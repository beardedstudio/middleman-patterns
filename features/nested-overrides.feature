Feature: Patterns can be composed of other patterns, and overrides should be inherited when composing patterns.

  Scenario: Render an atom in a molecule with overridden front-matter
    Given the Server is running at "patterns-with-data-app"
    When I go to "/nested/molecule"
    Then I should see "Overridden Atom" in ".nested-molecule .overridden"
    And I should see "Overridden Atom" in ".nested-molecule .default"
    But I should not see "This gets overridden at a higher level" in ".overridden"
    And I should not see "Default Atom" in ".default"

  Scenario: Render an Organism with front-matter
    Given the Server is running at "patterns-with-data-app"
    When I go to "/nested/organism"
    Then I should see "Overridden Atom" in ".overridden"
    And I should see "Overridden Molecule" in ".overridden"
    And I should see "Default Molecule" in ".default"
    And I should see "Default Atom" in ".default"

  Scenario: Render a set of overridden patterns through a Template
    Given the Server is running at "patterns-with-data-app"
    When I go to "/nested/template"
    Then I should see "Overridden Atom" in ".overridden"
    And I should see "Overridden Molecule" in ".overridden"
    And I should see "Overridden Organism" in ".overridden"
    And I should see "Overridden Template" in ".overridden"

  Scenario: Render a molecule with overridden data, then default data
    Given the Server is running at "patterns-with-data-app"
    When I go to "/nested/double-atoms"
    Then I should see "Overridden Atom" in ".overridden"
    And I should see "Default Atom" in ".atom"
