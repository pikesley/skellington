module Skellington
  describe CLI do
    let :subject do
      described_class.new
    end

    it 'generates a Code of Conduct' do
      subject.generate 'dummy-app'
      expect('dummy_app/CODE_OF_CONDUCT.md').to have_content (
      """
      # Contributor Code of Conduct

      As contributors and maintainers of this project, and in the interest of
      fostering an open and welcoming community, we pledge to respect all people who
      contribute through reporting issues, posting feature requests, updating
      documentation, submitting pull requests or patches, and other activities.
      """
      )
    end
  end
end
