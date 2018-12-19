# frozen_string_literal: true

require 'yaml'
require 'banks_registry/models/rule'

module BanksRegistry
  module Loaders
    class RulesLoader
      RULES_FOLDER = 'data/rules'

      def initialize
        @cache = {}
      end

      def call(code)
        return @cache[code] if @cache.key?(code)

        @cache[code] = Models::Rule.new(load_rule_yml(code))
      end

      private

      def load_rule_yml(code)
        YAML.load_file("#{RULES_FOLDER}/#{code}.yml")[code]
      end
    end
  end
end
