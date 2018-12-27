# frozen_string_literal: true

RSpec.describe BanksRegistry::Matchers::IbanMatcher do
  let(:fake_banks_loader) do
    Class.new do
      def call(*_); end
    end.new
  end

  let(:fake_rules_loader) do
    Class.new do
      def initialize(double)
        @double = double
      end

      def call(*_)
        @double
      end
    end.new(double(iban: 'TEST'))
  end

  let(:fake_rule_converter) do
    Class.new do
      def call(*_)
        /\ACH(\d{2})(\d{5}).+\z/
      end
    end.new
  end

  let(:fake_bank) { double(code: '123') }

  let(:fake_iban) { 'CH12 0012 3000 0000 0000 0' }

  describe 'When calling #call' do
    before do
      allow(BanksRegistry::Loaders::BanksLoader)
        .to receive(:new).and_return(fake_banks_loader)

      allow(BanksRegistry::Loaders::RulesLoader)
        .to receive(:new).and_return(fake_rules_loader)

      allow(BanksRegistry::RuleConverter)
        .to receive(:new).and_return(fake_rule_converter)
    end

    it 'Then calls BicMatcher' do
      allow(fake_banks_loader).to receive(:call).and_return([fake_bank])

      expect(subject.call(fake_iban)).to eq(fake_bank)
    end

    it 'Then returns nil if no rule available' do
      allow(fake_rules_loader).to receive(:call).and_return(nil)

      expect(subject.call(fake_iban)).to eq(nil)
    end
  end
end
