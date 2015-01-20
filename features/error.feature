Feature: Throw errors in bad situations

  Scenario: Render a pattern that doesn't exist
    Given the Server is running at "basic-patterns-app"
    When I go to "/non-existent-atom"
    Then I should see 'Error: Atom something-weird not found: patterns/atoms/something-weird'
