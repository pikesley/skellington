module Skellington
  describe CLI do
    let :subject do
      described_class.new
    end

    it 'generates correct output' do
      subject.options = { 'framework' => 'jekyll' }
      expect { subject.generate 'dummy-app' }.to output(/
Your new Jekyll site DummyApp has been created

\(Note that 'dummy-app' has been changed to 'dummy_app' because Ruby finds '-'s troubling\)

Now do

    cd dummy_app
    bundle
    bundle exec jekyll serve

which will launch the site \(at http:\/\/localhost:4000\/dummy-app\/\)

And presuming that works OK

    git add .
    git commit -m 'First commit'

You should also fill in your name in LICENSE.md
/).to_stdout
    end
  end
end
