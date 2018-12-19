# frozen_string_literal: true

RSpec.describe BanksRegistry::Matchers::BicMatcher do
  let(:fake_service) do
    Class.new do
      def call(*_); end
    end.new
  end

  let(:fake_bank) { double(bic: 'TESTMEBAYBE') }

  describe 'When calling #call' do
    it 'Then class BicMatcher' do
      allow(BanksRegistry::Loaders::BanksLoader)
        .to receive(:new).and_return(fake_service)

      expect(fake_service).to receive(:call).with('ME').and_return([fake_bank])

      expect(subject.call('TESTMEBAYBE')).to eq(fake_bank)
    end
  end
end
