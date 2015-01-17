Feature: Generate skellington

  Scenario: generate config.ru
    When I successfully run `skellington generate dummy_gem`
    Then a file named "dummy_gem/config.ru" should exist
    And the file "dummy_gem/config.ru" should contain:
    """
    require 'rubygems'
    require File.join(File.dirname(__FILE__), 'lib/dummy_gem.rb')

    run DummyGem
    """
