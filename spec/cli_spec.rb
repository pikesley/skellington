module Skellington
  describe CLI do
    let :subject do
      described_class.new
    end

    it 'has a version' do
      expect { subject.version }.to output(/^skellington version #{VERSION}$/).to_stdout
    end

    it 'generates correct output' do
      expect { subject.generate 'dummy_app' }.to output(/
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

You should also fill in your name in LICENSE.md

For post-install hints, try

    skellington postinstall
/).to_stdout
    end

    it 'suppresses the LICENSE help when supplied with a licensee' do
      subject.options = {licensee: 'Beyoncé'}
      expect { subject.generate 'dummy_app' }.to_not output(/
      You should also fill in your name in LICENSE.md
/).to_stdout
    end

    it 'gives helpful post-generate advice' do
      expect { subject.postinstall }.to output(/Some other things you might find useful \(sweeten to taste\):

\* Set up continuous integration in Travis:

    travis init

\* Configure a Heroku app:

    heroku apps:create YOUR-APP-NAME-HERE --region=eu

\* Get Travis to continuously deploy to Heroku:

    travis setup heroku
/).to_stdout
    end
  end
end
