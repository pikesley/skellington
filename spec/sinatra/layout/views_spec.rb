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

    it 'has a 404 page' do
      subject.generate 'dummy_app'

      expect('dummy_app/views/oops.erb').to have_content (
      """
      <h1>404</h1>

      <h2>Nothing to see here</h2>

      <a href='/'>Home</a>
      """
      )
    end
  end
end
