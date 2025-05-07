#!/usr/bin/env ruby -s
# frozen_string_literal: true

$LOAD_PATH.unshift "#{File.dirname(__FILE__)}/../lib"
require 'money'
require 'memory_profiler'
require_relative 'readme_examples'

I18n.config.available_locales = :en
Money.locale_backend = :i18n
Money.rounding_mode = BigDecimal::ROUND_HALF_UP

report = MemoryProfiler.report(allow_files: 'money') do
  10.times do
    ReadmeExamples.call
  end
end

report.pretty_print
