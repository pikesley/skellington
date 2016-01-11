Feature: Generate skellington

  Scenario: generate config.ru
    When I successfully run `skellington generate dummy_app`
    Then a file named "dummy_app/config.ru" should exist
    And the file "dummy_app/config.ru" should contain:
    """
    require 'rubygems'
    require File.join(File.dirname(__FILE__), 'lib/dummy_app.rb')

    run DummyApp
    """
