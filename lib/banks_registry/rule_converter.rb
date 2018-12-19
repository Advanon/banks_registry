# frozen_string_literal: true

module BanksRegistry
  class RuleConverter
    CONVENTIONS = {
      '(\d+)!n' => '(\d{\1})',
      '(\d+)!c' => '([A-Za-z0-9]{\1})',
      '(\d+)!e' => '(\s{\1})',
      '(\d+)!a' => '([A-Z]{\1})',
      '(\d+)n' => '(\d{1,\1})',
      '(\d+)c' => '([A-Za-z0-9]{1,\1})',
      '(\d+)e' => '(\s{1,\1})',
      '(\d+)a' => '([A-Z]{1,\1})'
    }.freeze

    def call(rule)
      Regexp.new("\\A#{prepare_for_regexp(rule)}\\z")
    end

    private

    def prepare_for_regexp(rule)
      CONVENTIONS.each.inject(rule) do |memo, (k, v)|
        memo.gsub(Regexp.new(k), v)
      end
    end
  end
end
