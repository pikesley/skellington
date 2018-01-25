module Skellington
  describe CLI do
    let :subject do
      described_class.new
    end

    it 'has a version' do
      expect { subject.version }.to output(/^skellington version #{VERSION}$/).to_stdout
    end

    it 'generates correct output' do
      expect { subject.generate 'hyphenated-name' }.to output(/
Your new Sinatra app HyphenatedName has been created

\(Note that 'hyphenated-name' has been changed to 'hyphenated_name' because Ruby finds '-'s troubling\)

Now do

    cd \.\/hyphenated_name
    bundle
    bundle exec rake

And presuming that passes OK

    git add .
    git commit -m 'First commit'

/).to_stdout

      expect(File).to exist 'hyphenated_name/lib/hyphenated_name.rb'
    end
  end
end
