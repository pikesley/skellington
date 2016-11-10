module Skellington
  describe CLI do
    let :subject do
      described_class.new
    end

    it 'generates a Guardfile' do
      subject.generate 'dummy_app'
      expect('dummy_app/Guardfile').to have_content (
      """
      guard :jasmine do
        /watch/
        /watch/
        /watch/
        /watch/
      end

      guard :rspec, cmd: 'bundle exec rspec' do
        require 'guard/rspec/dsl'
        dsl = Guard::RSpec::Dsl.new(self)

        rspec = dsl.rspec
        watch(rspec.spec_helper) { rspec.spec_dir }
        watch(rspec.spec_support) { rspec.spec_dir }
        watch(rspec.spec_files)

        ruby = dsl.ruby
        dsl.watch_spec_files_for(ruby.lib_files)
      end
      """
      )
    end
  end
end
