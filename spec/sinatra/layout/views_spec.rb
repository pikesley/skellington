module Skellington
  describe CLI do
    let :subject do
      described_class.new
    end

    it 'generates a view' do
      subject.generate 'dummy_app'

      expect('dummy_app/views/index.erb').to have_content (
      """
      <%= @content %>
      """
      )
    end
  end
end
