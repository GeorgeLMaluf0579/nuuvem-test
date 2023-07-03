#frozen_string_literal: true

require 'oj'

Blueprinter.configure do |config|
  config.generator = Oj
  config.datetime_format = ->(date) { date.nil? ? date : date.to_datetime.rfc3339}
end