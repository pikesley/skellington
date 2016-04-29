[![Build Status](http://img.shields.io/travis/pikesley/skellington.svg?style=flat-square)](https://travis-ci.org/pikesley/skellington)
[![Dependency Status](http://img.shields.io/gemnasium/pikesley/skellington.svg?style=flat-square)](https://gemnasium.com/pikesley/skellington)
[![Coverage Status](http://img.shields.io/coveralls/pikesley/skellington.svg?style=flat-square)](https://coveralls.io/r/pikesley/skellington)
[![Code Climate](http://img.shields.io/codeclimate/github/pikesley/skellington.svg?style=flat-square)](https://codeclimate.com/github/pikesley/skellington)
[![Gem Version](http://img.shields.io/gem/v/skellington.svg?style=flat-square)](https://rubygems.org/gems/skellington)
[![License](http://img.shields.io/:license-mit-blue.svg?style=flat-square)](http://pikesley.mit-license.org)
[![Badges](http://img.shields.io/:badges-7/7-ff6799.svg?style=flat-square)](https://github.com/badges/badgerbadgerbadger)

# Skellington

Extremely opinionated generator for your [Sinatra](http://www.sinatrarb.com/) app. Sets up:

* [Rspec](http://rspec.info/)
* [Jasmine](http://jasmine.github.io/2.0/introduction.html)
* [Bootstrap](http://getbootstrap.com/)
* [Compass](http://compass-style.org/)
* An MIT License file

Should work fine for both RVM- and rbenv-based setups

    $ gem install skellington
    $ skellington generate naming-things-is-hard --licensor 'Beyoncé'
    Generating <lots of stuff>... done

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

        bundle exec rackup

    (with

        bundle exec compass watch .

    in a different terminal window)

    For post-install hints, try

        skellington postinstall

This assumes a bunch of things, at least:

* That you have a reasonable git installation

Also, it will set up the new project using whatever version of ruby is cromulent when you run it
