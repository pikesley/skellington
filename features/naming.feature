Feature: Fix app_name

Scenario: App name does not like a hyphen
  When I successfully run `skellington generate hyphenated-name`
  Then a directory named "hyphenated_name/lib/" should exist
  And a file named "hyphenated_name/lib/hyphenated_name.rb" should exist
