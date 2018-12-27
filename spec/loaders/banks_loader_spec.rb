# frozen_string_literal: true

RSpec.describe BanksRegistry::Loaders::BanksLoader do
  describe 'When calling #call' do
    let(:fake_yml) { { 'CH' => [{}, {}] } }

    before do
      allow(YAML).to receive(:load_file).and_return(fake_yml)
    end

    it 'Then returns list of banks' do
      result = subject.call('CH')

      expect(result.size).to eq(2)

      expect(result[0]).to be_a(BanksRegistry::Models::Bank)
    end

    it 'Then returns nil if code does not exist' do
      allow(File).to receive(:file?).and_return(false)

      expect(subject.call('CH')).to eq(nil)
    end
  end
end
