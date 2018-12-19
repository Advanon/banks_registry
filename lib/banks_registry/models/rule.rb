# frozen_string_literal: true

module BanksRegistry
  module Models
    class Rule
      def initialize(attributes = {})
        @attributes = attributes
      end

      def iban
        attributes['iban']
      end

      def bban
        attributes['bban']
      end

      private

      attr_reader :attributes
    end
  end
end
