# frozen_string_literal: true

module BanksRegistry
  module Models
    class Bank
      def initialize(attributes = {})
        @attributes = attributes
      end

      def name
        attributes['name']
      end

      def code
        attributes['code']
      end

      def bic
        attributes['swift']
      end

      def bic8
        attributes['swift8']
      end

      def branch_name
        attributes['branch_name']
      end

      def branch_address
        attributes['branch_address']
      end

      def branch_code
        attributes['branch_code']
      end

      def city
        attributes['city']
      end

      def country
        attributes['country']
      end

      private

      attr_reader :attributes
    end
  end
end
