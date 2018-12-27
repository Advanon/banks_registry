# frozen_string_literal: true

require 'banks_registry/rule_converter'
require 'banks_registry/loaders/rules_loader'

module BanksRegistry
  module Matchers
    class IbanMatcher
      LEADING_ZEROS_REGEX = /\A0+([^0])/.freeze
      EXTRA_ZEROS_REGEX = /\A0+\z/.freeze
      CLEAR_IBAN_REGEX = /\s/.freeze

      def call(iban)
        bank_code_from_iban = bank_code(iban)

        return unless bank_code_from_iban

        banks_loader.call(country_from_iban(iban)).find do |bank|
          clear_code(bank.code) == clear_code(bank_code_from_iban)
        end
      end

      private

      def country_from_iban(iban)
        iban[0..1].upcase
      end

      def clear_code(bank_code)
        bank_code.gsub(LEADING_ZEROS_REGEX, '\1').gsub(EXTRA_ZEROS_REGEX, '0')
      end

      def clear_iban(iban)
        iban.gsub(CLEAR_IBAN_REGEX, '')
      end

      def bank_code(iban)
        bank_code_regexp(iban)&.match(clear_iban(iban))&.[](2)
      end

      def bank_code_regexp(iban)
        rule = iban_rule(country_from_iban(iban))
        rule_converter.call(rule) if rule
      end

      def iban_rule(code)
        rules_loader.call(code)&.iban
      end

      def rule_converter
        @rule_converter ||= ::BanksRegistry::RuleConverter.new
      end

      def rules_loader
        @rules_loader ||= ::BanksRegistry::Loaders::RulesLoader.new
      end

      def banks_loader
        @banks_loader ||= ::BanksRegistry::Loaders::BanksLoader.new
      end
    end
  end
end
