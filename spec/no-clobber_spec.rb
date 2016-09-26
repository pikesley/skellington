module Skellington
  describe CLI do
    let :subject do
      described_class.new
    end

    it 'does not overwrite an existing path' do
      FileUtils.mkdir 'existing_path'
      expect { subject.generate 'existing_path' }.to exit_with_status 1
      expect(File).to_not exist 'existing_path/lib'
    end
  end
end
