#!/usr/bin/env ruby -s
# frozen_string_literal: true

$LOAD_PATH.unshift "#{File.dirname(__FILE__)}/../lib"
require 'money'
require 'benchmark'
require_relative 'readme_examples'

I18n.config.available_locales = :en
Money.locale_backend = :i18n
Money.rounding_mode = BigDecimal::ROUND_HALF_UP

Benchmark.bmbm(30) do |x|
  x.report('README Examples') do
    10_000.times do
      ReadmeExamples.call
    end
  end

  x.report('Money#from_cents') do
    100_000.times do
      Money.from_cents(100, "USD")
    end
  end

  x.report('Money#format') do
    50_000.times do
      Money.from_cents(100, "USD").format
    end
  end
end
