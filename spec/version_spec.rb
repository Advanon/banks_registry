# frozen_string_literal: true

RSpec.describe BanksRegistry::VERSION do
  it 'Then returns a correct version number' do
    expect(BanksRegistry::VERSION).to eq('0.1.3')
  end
end
