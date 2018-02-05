module Skellington
  describe CLI do
    let :subject do
      described_class.new
    end

    it 'creates a libs data file' do
      subject.options = { 'framework' => 'jekyll' }
      subject.generate 'dummy-app'

      expect(Dir).to exist 'dummy_app/_data'
      expect('dummy_app/_data/libs.yml').to have_content (
      """
      js:
        - name: jquery
          url:  //code.jquery.com/jquery-3.2.1.slim.min.js
          hash: sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN
        - name: popper
          url:  //cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js
          hash: sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q
        - name: bootstrap
          url:  //maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js
          hash: sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl
        - name: fontawesome
          url:  //use.fontawesome.com/releases/v5.0.4/js/all.js

      css:
        - name: foo
          bar:  //bar.com/baz.css

      fonts:
        - name: ubuntu
          url:  //fonts.googleapis.com/css?family=Ubuntu+Mono
      """
      )
    end
  end
end
