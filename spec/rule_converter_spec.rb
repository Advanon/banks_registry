# frozen_string_literal: true

RSpec.describe BanksRegistry::RuleConverter do
  describe 'When calling #call' do
    let(:rule) { '2!a2!n5c1!e10c' }
    let(:matching) { 'AB12ab5 4j9gp2e4' }
    let(:failing) { 'AB12ab5 4j9gp2e4g7t' }

    it 'Then converts given rule to corresponding regex' do
      expect(subject.call(rule)).not_to be_nil
    end

    it 'Then matches to a correct string' do
      matches = subject.call(rule).match(matching)

      expect(matches[1]).to eq('AB')
      expect(matches[2]).to eq('12')
      expect(matches[3]).to eq('ab5')
      expect(matches[4]).to eq(' ')
      expect(matches[5]).to eq('4j9gp2e4')
    end

    it 'Then does not match to an invalid string' do
      expect(subject.call(rule).match(failing)).to be_nil
    end
  end
end
