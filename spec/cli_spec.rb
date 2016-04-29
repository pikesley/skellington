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

\(with

    bundle exec compass watch .

in a different terminal window\)

You should also fill in your name in LICENSE.md

For post-install hints, try

    skellington postinstall
/).to_stdout
    end

    it 'suppresses the LICENSE help when supplied with a licensor' do
      subject.options = {licensor: 'Beyoncé'}
      expect { subject.generate 'dummy_app' }.to_not output(/
      You should also fill in your name in LICENSE.md
/).to_stdout
    end

    it 'gives helpful post-generate advice' do
      expect { subject.postinstall }.to output(/For some other things you might find useful, see this gist:

    https:\/\/gist.github.com\/pikesley\/1789cab7b10f0d8765d4
/).to_stdout
    end
  end
end
