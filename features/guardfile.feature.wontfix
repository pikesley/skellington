Feature: Generate skellington

  Scenario: generate Guardfile
    When I successfully run `skellington generate dummy_app`
    Then a file named "dummy_app/Guardfile" should exist
    And the file "dummy_app/Guardfile" should contain:
    """
    guard :cucumber do
      watch %r{^features/.+\.feature$}
      watch(%r{^features/support/.+$}) { 'features' }

      watch(%r{^features/step_definitions/(.+)_steps\.rb$}) do |m|
        Dir[File.join("**/#{m[1]}.feature")][0] || 'features'
      end
    end
    """
