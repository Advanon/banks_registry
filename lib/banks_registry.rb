# frozen_string_literal: true

require 'banks_registry/version'
require 'banks_registry/matchers/bic_matcher'
require 'banks_registry/matchers/iban_matcher'

module BanksRegistry
  class << self
    def find_by_bic(bic)
      bic_matcher.call(bic)
    end

    def find_by_iban(iban)
      iban_matcher.call(iban)
    end

    private

    def bic_matcher
      @bic_matcher ||= Matchers::BicMatcher.new
    end

    def iban_matcher
      @iban_matcher ||= Matchers::IbanMatcher.new
    end
  end
end
