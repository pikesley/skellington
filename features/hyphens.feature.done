Feature: Generate skellington

  Scenario: change the names if there are hyphens
    When I successfully run `skellington generate hyphenated-name`
    Then the output should contain "Generating hyphenated_name/Gemfile"
    And the output should contain "bundle"
    And the output should contain:
    """
    Your new Sinatra app HyphenatedName has been created

    (Note that 'hyphenated-name' has been changed to 'hyphenated_name' because Ruby finds '-'s troubling)

    Now do

        cd hyphenated_name
        bundle
        bundle exec rake

    And presuming that passes OK

        git add .
        git commit -m 'First commit'

    You can run the app with

        bundle exec rackup
    """
