Feature: Generate skellington

  Scenario: get some feedback
    When I successfully run `skellington generate dummy_app`
    Then the output should contain "Generating dummy_app/Gemfile"
    And the output should contain "bundle"
    And the output should contain:
    """
    Your new Sinatra app DummyApp has been created

    Now do

        cd dummy_app
        bundle
        bundle exec rake

    And presuming that passes OK

        git add .
        git commit -m 'First commit'

    You can run the app with

        bundle exec rackup
    """

  Scenario: get the version
    When I successfully run `skellington -v`
    Then the output should contain "skellington version"
