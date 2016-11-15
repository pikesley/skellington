module Skellington
  describe CLI do
    let :subject do
      described_class.new
    end

    it 'generates a config/config.yml file' do
      subject.generate 'dummy-app'
      expect('dummy_app/config/config.yml').to have_content (
      """
      #google-analytics-tag: UA-00000000-0
      #github_url: https://github.com # also uncomment the `include` line in `styles.scss`
      """
      )
    end
  end
end
