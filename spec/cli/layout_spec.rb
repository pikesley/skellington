module Skellington
  describe CLI do
    let :subject do
      described_class.new
    end

    it 'generates a default layout' do
      subject.generate 'dummy_app'
      expect('dummy_app/views/default.erb').to have_content (
      """
      <!DOCTYPE html>
      <html lang='en'>
        /erb.*'includes/header'/
        <body>
          /erb.*'includes/github-corner'/
          <div class='container'>
            <div class='row'>
              <div class='col-md-2'></div>
              <div class='col-md-8'>
                <%= yield %>
              </div>
              <div class='col-md-2'></div>
            </div>
          </div>
          /erb.*:'includes/footer'/
        </body>
      </html>
      """
      )
    end
  end
end
