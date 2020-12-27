require 'simplecov'
SimpleCov.start do
  add_filter '/spec/'
end
SimpleCov.minimum_coverage 90
