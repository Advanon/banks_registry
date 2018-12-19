# frozen_string_literal: true

RSpec.describe BanksRegistry::Models::Bank do
  let(:attributes) do
    {
      'name' => 'Zurich testbank',
      'code' => '0',
      'swift' => 'ABCDCHMMXXX',
      'swift8' => 'ABCDCHMM',
      'branch_name' => 'Head Office',
      'branch_address' => 'Teststrasse 60',
      'branch_code' => 'XXX',
      'city' => 'Zürich',
      'country' => 'Switzerland',
    }
  end

  subject { described_class.new(attributes) }

  describe 'When calling #name' do
    it 'Then returns a correct value' do
      expect(subject.name).to eq('Zurich testbank')
    end
  end

  describe 'When calling #code' do
    it 'Then returns a correct value' do
      expect(subject.code).to eq('0')
    end
  end

  describe 'When calling #bic' do
    it 'Then returns a correct value' do
      expect(subject.bic).to eq('ABCDCHMMXXX')
    end
  end

  describe 'When calling #bic8' do
    it 'Then returns a correct value' do
      expect(subject.bic8).to eq('ABCDCHMM')
    end
  end

  describe 'When calling #branch_name' do
    it 'Then returns a correct value' do
      expect(subject.branch_name).to eq('Head Office')
    end
  end

  describe 'When calling #branch_address' do
    it 'Then returns a correct value' do
      expect(subject.branch_address).to eq('Teststrasse 60')
    end
  end

  describe 'When calling #branch_code' do
    it 'Then returns a correct value' do
      expect(subject.branch_code).to eq('XXX')
    end
  end

  describe 'When calling #city' do
    it 'Then returns a correct value' do
      expect(subject.city).to eq('Zürich')
    end
  end

  describe 'When calling #country' do
    it 'Then returns a correct value' do
      expect(subject.country).to eq('Switzerland')
    end
  end
end
