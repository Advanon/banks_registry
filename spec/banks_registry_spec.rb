# frozen_string_literal: true

RSpec.describe BanksRegistry do
  subject { described_class }

  let(:fake_service) do
    Class.new do
      def call(*_); end
    end.new
  end

  describe 'When calling #find_by_bic' do
    it 'Then class BicMatcher' do
      expect(BanksRegistry::Matchers::BicMatcher)
        .to receive(:new).and_return(fake_service)

      expect(fake_service).to receive(:call)

      subject.find_by_bic('test')
    end
  end

  describe 'When calling #find_by_iban' do
    it 'Then class IbanMatcher' do
      expect(BanksRegistry::Matchers::IbanMatcher)
        .to receive(:new).and_return(fake_service)

      expect(fake_service).to receive(:call)

      subject.find_by_iban('test')
    end
  end
end
