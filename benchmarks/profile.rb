#!/usr/bin/env ruby -s
# frozen_string_literal: true

$LOAD_PATH.unshift "#{File.dirname(__FILE__)}/../lib"
require 'money'
require 'ruby-prof'
require_relative 'readme_examples'

I18n.config.available_locales = :en
Money.locale_backend = :i18n
Money.rounding_mode = BigDecimal::ROUND_HALF_UP

result = RubyProf::Profile.profile do
  10.times do
    ReadmeExamples.call
  end
end

printer = RubyProf::FlatPrinter.new(result)
printer.print($stdout, {})
