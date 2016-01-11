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
/).to_stdout
    end
  end
end
