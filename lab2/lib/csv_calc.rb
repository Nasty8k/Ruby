# frozen_string_literal: true

require 'csv'

class CSVcalc
  attr_accessor :data, :cols, :rows

  def initialize(path)
    @file = path
    @data = CSV.parse(File.read(path))
    @cols = @data[0].length - 1
    @rows = @data.length - 1
    @mean = 0.0
  end

  def min(array)
    array.min
  end

  def max(array)
    array.max
  end

  def mean(array)
    @mean = (array.inject { |sum, i| sum + i }.to_f / @rows).round(2)
  end

  def sample_variance(array)
    @mean = mean(array)
    sum = array.map { |i| (i - @mean)**2 }
    sum = sum.reduce(:+)
    (sum / @rows - 1).round(2)
  end
end
