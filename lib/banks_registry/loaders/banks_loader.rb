# frozen_string_literal: true

require 'yaml'
require 'banks_registry/models/bank'

module BanksRegistry
  module Loaders
    class BanksLoader
      BANKS_FOLDER = File.join(__dir__, '..', '..', '..', 'data', 'banks')

      def initialize
        @cache = {}
      end

      def call(code)
        return @cache[code] if @cache.key?(code)
        return unless file_exists?(code)

        @cache[code] =
          YAML.load_file(filename(code))[code].map do |bank|
            Models::Bank.new(bank)
          end
      end

      private

      def file_exists?(code)
        File.file?(filename(code))
      end

      def filename(code)
        "#{BANKS_FOLDER}/#{code}.yml"
      end
    end
  end
end
