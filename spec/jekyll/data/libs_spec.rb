module Skellington
  describe CLI do
    let :subject do
      described_class.new
    end

    it 'creates a libs data file' do
      subject.options = { 'framework' => 'jekyll' }
      subject.generate 'dummy_app'

      expect(Dir).to exist 'dummy_app/_data'
      expect('dummy_app/_data/libs.yml').to have_content (
      """
      js:
        - name: jquery
          url:  //ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js
        - name: bootstrap
          url:  //maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js

      #css:
      #  - name: foo
      #    url:  //bar.com/baz.css
      """
      )
    end
  end
end
