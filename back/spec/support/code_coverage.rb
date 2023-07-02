# frozen_string_literal: true
require 'simplecov'

Simplecov.start 'rails' do
  add_filter '/bin/'
  add_filter '/db/'
  add_filter '/spec/'
  
  add_group 'Models', 'app/models'
  add_group 'Controllers', 'app/controllers'
end
