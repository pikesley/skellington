[![Build Status](http://img.shields.io/travis/pikesley/skellington.svg)](https://travis-ci.org/pikesley/skellington)
[![Dependency Status](http://img.shields.io/gemnasium/pikesley/skellington.svg)](https://gemnasium.com/pikesley/skellington)
[![Code Climate](http://img.shields.io/codeclimate/github/pikesley/skellington.svg)](https://codeclimate.com/github/pikesley/skellington)
[![Gem Version](http://img.shields.io/gem/v/skellington.svg)](https://rubygems.org/gems/skellington)
[![License](http://img.shields.io/:license-mit-blue.svg)](http://pikesley.mit-license.org)
[![Badges](http://img.shields.io/:badges-6/6-ff6799.svg)](https://github.com/badges/badgerbadgerbadger)

# Skellington

Generate tedious Cucumber and Sinatra boilerplate like a boss

    $ skellington generate naming_things_is_hard

    Generating naming_things_is_hard/Gemfile...done
    Generating naming_things_is_hard/Rakefile...done
    Generating naming_things_is_hard/Procfile...done
    Generating naming_things_is_hard/config.ru...done
    Generating naming_things_is_hard/features/naming_things_is_hard.feature...done
    Generating naming_things_is_hard/features/support/env.rb...done
    Generating naming_things_is_hard/lib/naming_things_is_hard.rb...done

    Your new Sinatra app 'NamingThingsIsHard' has been created

    Now do

        cd naming_things_is_hard
        bundle
        rake

    And presuming that passes OK

        badger > README.md
        git add .
        git commit -m 'First commit'

    You can run the app with

        rackup

This assumes a bunch of things, at least:

* That you have a reasonable git installation
* That you're using _RVM_ - I think I just need a `.ruby-version` file to make this play nice with _rbenv_, is that correct?

Also, it will set up the new project using whatever version of ruby is cromulent when you run it
