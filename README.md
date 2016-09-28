[![Build Status](http://img.shields.io/travis/pikesley/skellington.svg?style=flat-square)](https://travis-ci.org/pikesley/skellington)
[![Dependency Status](http://img.shields.io/gemnasium/pikesley/skellington.svg?style=flat-square)](https://gemnasium.com/pikesley/skellington)
[![Dependency CI](http://dependencyci.com/github/pikesley/skellington/badge?style=flat-square)](http://dependencyci.com/github/pikesley/skellington)
[![Coverage Status](http://img.shields.io/coveralls/pikesley/skellington.svg?style=flat-square)](https://coveralls.io/r/pikesley/skellington)
[![Code Climate](http://img.shields.io/codeclimate/github/pikesley/skellington.svg?style=flat-square)](https://codeclimate.com/github/pikesley/skellington)
[![Gem Version](http://img.shields.io/gem/v/skellington.svg?style=flat-square)](https://rubygems.org/gems/skellington)
[![License](http://img.shields.io/:license-mit-blue.svg?style=flat-square)](http://pikesley.mit-license.org)

# Skellington

Extremely opinionated generator for your [Sinatra](http://www.sinatrarb.com/)  app or [Jekyll](https://jekyllrb.com/) site. Sets up:

* Sinatra
  * [Rspec](http://rspec.info/)
  * [Jasmine](http://jasmine.github.io/2.0/introduction.html)
  * [Bootstrap](http://getbootstrap.com/)
  * [Compass](http://compass-style.org/)
  * An MIT License file

* Jekyll
  * [Jekyll](https://jekyllrb.com/)
  * [Bootstrap](http://getbootstrap.com/)
  * Reasonable default things

Should work fine for both RVM- and rbenv-based setups

## Installation

    git clone https://github.com/pikesley/skellington
    cd skellington
    bundle
    rake
    rake install

or just

    gem install skellington

## Usage

### Sinatra

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

    Then try

        bundle exec rake run

    which will launch Compass and then run the app (at http://localhost:9292)

    For post-install hints, try

        skellington postinstall

### Jekyll

    $ gem install skellington
    $ skellington generate hello-from-the-magic-tavern --framework jekyll
    Generating <lots of stuff>... done

    Your new Jekyll site HelloFromTheMagicTavern has been created

    (Note that 'hello-from-the-magic-tavern' has been changed to 'hello_from_the_magic_tavern' because Ruby finds '-'s troubling)

    Now do

        cd hello_from_the_magic_tavern
        bundle
        bundle exec jekyll serve

    which will launch the site (at http://localhost:4000)

    And presuming that works OK

        git add .
        git commit -m 'First commit'

    You should also fill in your name in LICENSE.md

### Options

* --framework
  * Framework for which to generate
  * Default: sinatra
  * Possible values: sinatra, jekyll

* --bootstrap
  * Bootstrap major version to include
  * Default: 3
  * Possible values: 3, 4

* --licensor
  * Name to include in the license file

---

This all assumes a bunch of things, at least:

* That you have a reasonable git installation

Also, it will set up the new project using whatever version of ruby is cromulent when you run it
