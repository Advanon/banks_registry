# frozen_string_literal: true

require 'yaml'
require 'banks_registry/models/bank'

module BanksRegistry
  module Loaders
    class BanksLoader
      BANKS_FOLDER = 'data/banks'

      def initialize
        @cache = {}
      end

      def call(code)
        return @cache[code] if @cache.key?(code)

        @cache[code] =
          YAML.load_file("#{BANKS_FOLDER}/#{code}.yml")[code].map do |bank|
            Models::Bank.new(bank)
          end
      end
    end
  end
end
