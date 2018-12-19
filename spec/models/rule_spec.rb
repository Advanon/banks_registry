# frozen_string_literal: true

RSpec.describe BanksRegistry::Models::Rule do
  let(:attributes) do
    {
      'iban' => 'test iban',
      'bban' => 'test bban',
    }
  end

  subject { described_class.new(attributes) }

  describe 'When calling #iban' do
    it 'Then returns a correct value' do
      expect(subject.iban).to eq('test iban')
    end
  end

  describe 'When calling #bban' do
    it 'Then returns a correct value' do
      expect(subject.bban).to eq('test bban')
    end
  end
end
