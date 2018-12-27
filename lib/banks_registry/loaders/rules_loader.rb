# frozen_string_literal: true

require 'yaml'
require 'banks_registry/models/rule'

module BanksRegistry
  module Loaders
    class RulesLoader
      RULES_FOLDER = File.join(__dir__, '..', '..', '..', 'data', 'rules')

      def initialize
        @cache = {}
      end

      def call(code)
        return @cache[code] if @cache.key?(code)
        return unless file_exists?(code)

        @cache[code] = Models::Rule.new(load_rule_yml(code))
      end

      private

      def file_exists?(code)
        File.file?(filename(code))
      end

      def filename(code)
        "#{RULES_FOLDER}/#{code}.yml"
      end

      def load_rule_yml(code)
        YAML.load_file(filename(code))[code]
      end
    end
  end
end
