module Skellington
  describe CLI do
    let :subject do
      described_class.new
    end

    it 'generates a Procfile' do
      subject.generate 'dummy_app'
      expect('dummy_app/Procfile').to contain (
      """
      web: bundle exec ruby lib/dummy_app.rb
      """
      )
    end
  end
end
