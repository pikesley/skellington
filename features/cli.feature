Feature: Generate skellington

  Scenario: get some feedback
    When I successfully run `skellington generate dummy_gem`
    Then the output should contain "Generating dummy_gem/Gemfile"
    And the output should contain "bundle"
    And the output should contain "rake"

  Scenario: get the version
    When I successfully run `skellington -v`
    Then the output should contain "skellington version"  
