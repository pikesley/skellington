module Skellington
  describe CLI do
    let :subject do
      described_class.new
    end

    it 'generates javascript files' do
      subject.generate 'dummy_app'
      expect('dummy_app/spec/javascripts/support/jasmine.yml').to have_content (
      """
      src_files:
        - public/js/**/*.js
      stylesheets:
        - stylesheets/**/*.css
      helpers:
        - helpers/**/*.js
      spec_files:
        - '**/*[sS]pec.js'
      src_dir:
      spec_dir:
      spec_helper: spec/javascripts/support/jasmine_helper.rb
      boot_dir:
      boot_files:
      server: 'puma'
      random: true
      """
      )

      expect(File).to exist 'dummy_app/spec/javascripts/support/jasmine_helper.rb'

      expect('dummy_app/spec/javascripts/dummy_app_spec.js').to have_content (
      """
      describe('DummyApp', function() {
        it('knows the truth', function() {
          expect(true).toEqual(true)
        })
      })
      """
      )
    end
  end
end
