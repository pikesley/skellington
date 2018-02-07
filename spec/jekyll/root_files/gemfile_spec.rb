module Skellington
  describe CLI do
    context 'jekyll' do
      let :subject do
        described_class.new
      end

      it 'generates a Gemfile' do
        subject.options = { 'framework' => 'jekyll' }
        subject.generate 'dummy-app'
        expect('dummy_app/Gemfile').to have_content (
        """
        source 'https://rubygems.org'

        /ruby '[0-9]*\\.[0-9]*\\.[0-9]*'/

        gem 'github-pages'
        gem 'rake'
        """
        )
      end
    end
  end
end
