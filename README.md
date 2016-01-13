[![Build Status](http://img.shields.io/travis/pikesley/skellington.svg?style=flat-square)](https://travis-ci.org/pikesley/skellington)
[![Dependency Status](http://img.shields.io/gemnasium/pikesley/skellington.svg?style=flat-square)](https://gemnasium.com/pikesley/skellington)
[![Coverage Status](http://img.shields.io/coveralls/pikesley/skellington.svg?style=flat-square)](https://coveralls.io/r/pikesley/skellington)
[![Code Climate](http://img.shields.io/codeclimate/github/pikesley/skellington.svg?style=flat-square)](https://codeclimate.com/github/pikesley/skellington)
[![Gem Version](http://img.shields.io/gem/v/skellington.svg?style=flat-square)](https://rubygems.org/gems/skellington)
[![License](http://img.shields.io/:license-mit-blue.svg?style=flat-square)](http://pikesley.mit-license.org)
[![Badges](http://img.shields.io/:badges-7/7-ff6799.svg?style=flat-square)](https://github.com/badges/badgerbadgerbadger)

# Skellington

Extremely opinionated generator for your [Sinatra](http://www.sinatrarb.com/) app. Sets up:

* [Cucumber](https://cucumber.io/)
  * with [cucumber-api-steps](https://github.com/jayzes/cucumber-api-steps)
* [Rspec](http://rspec.info/)
* [Jasmine](http://jasmine.github.io/2.0/introduction.html)
* [Bootstrap](http://getbootstrap.com/)

Should work fine for both RVM- and rbenv-based setups

    $ gem install skellington
    $ skellington generate naming-things-is-hard
    Generating naming_things_is_hard/Gemfile...done
    Generating naming_things_is_hard/Guardfile...done
    Generating naming_things_is_hard/Rakefile...done
    Generating naming_things_is_hard/Procfile...done
    Generating naming_things_is_hard/.ruby-version...done
    Generating naming_things_is_hard/.rspec...done
    Generating naming_things_is_hard/.gitignore...done
    Generating naming_things_is_hard/config.ru...done
    Generating naming_things_is_hard/features/naming_things_is_hard.feature...done
    Generating naming_things_is_hard/features/json.feature...done
    Generating naming_things_is_hard/features/step_definitions/naming_things_is_hard_steps.rb...done
    Generating naming_things_is_hard/features/support/env.rb...done
    Generating naming_things_is_hard/lib/naming_things_is_hard.rb...done
    Generating naming_things_is_hard/lib/naming_things_is_hard/racks.rb...done
    Generating naming_things_is_hard/lib/naming_things_is_hard/helpers.rb...done
    Generating naming_things_is_hard/views/default.erb...done
    Generating naming_things_is_hard/views/index.erb...done
    Generating naming_things_is_hard/views/includes/header.erb...done
    Generating naming_things_is_hard/spec/spec_helper.rb...done
    Generating naming_things_is_hard/spec/naming_things_is_hard/naming_things_is_hard_spec.rb...done
    Generating naming_things_is_hard/spec/javascripts/support/jasmine.yml...done
    Generating naming_things_is_hard/spec/javascripts/support/jasmine_helper.rb...done
    Generating naming_things_is_hard/spec/javascripts/naming_things_is_hardSpec.js...done
    Generating naming_things_is_hard/public/assets/favicon.ico...done
    Generating naming_things_is_hard/public/css/styles.css...done
    Generating naming_things_is_hard/public/js/naming_things_is_hard.js...done

    Your new Sinatra app NamingThingsIsHard has been created

    (Note that 'naming-things-is-hard' has been changed to 'naming_things_is_hard' because Ruby finds '-'s troubling)

    Now do

      cd naming_things_is_hard
      bundle
      rake

    And presuming that passes OK

      git add .
      git commit -m 'First commit'

    You can run the app with

      rackup

This assumes a bunch of things, at least:

* That you have a reasonable git installation

Also, it will set up the new project using whatever version of ruby is cromulent when you run it
