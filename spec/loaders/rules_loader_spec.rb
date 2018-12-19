# frozen_string_literal: true

RSpec.describe BanksRegistry::Loaders::RulesLoader do
  describe 'When calling #call' do
    let(:fake_yml) { { 'CH' => {} } }

    before do
      allow(YAML).to receive(:load_file).and_return(fake_yml)
    end

    it 'Then returns list of banks' do
      expect(subject.call('CH')).to be_a(BanksRegistry::Models::Rule)
    end
  end
end
