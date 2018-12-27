# frozen_string_literal: true

require 'banks_registry/loaders/banks_loader'

module BanksRegistry
  module Matchers
    class BicMatcher
      def call(bic)
        banks_loader.call(country_from_bic(bic))&.find do |bank|
          bank.bic == bic
        end
      end

      private

      def country_from_bic(bic)
        bic[4..5].upcase
      end

      def banks_loader
        @banks_loader ||= ::BanksRegistry::Loaders::BanksLoader.new
      end
    end
  end
end
