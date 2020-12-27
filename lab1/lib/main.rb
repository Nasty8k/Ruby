# frozen_string_literal: true

require_relative 'converter_ckf'

class Main
  def self.number_reader
    numbers = gets.chomp
    if numbers.to_f.to_i.to_s == numbers
      numbers.to_i
    else
      'error'
    end
  end

  def self.start
    puts 'Enter value for degrees'
    value = number_reader
    if value == 'error'
      puts 'incorrect value'
    else
      puts 'Enter FROM (C, F, K):'
      from = gets.chomp.upcase
      until from === 'C' || from === 'F' || from === 'K' do
        puts 'Error!!!'
        puts '>>Enter FROM (C, F, K)'
        from = gets.chomp.upcase
      end

      puts 'Enter TO (C, F, K):'
      to = gets.chomp.upcase
      until to === 'C' || to === 'F' || to === 'K' do
        puts 'Error!!!'
        puts '>>Enter TO (C, F, K)'
        to = gets.chomp.upcase
      end
      puts 'Convert result:', ConverterCKF.convert(value, from, to)
    end
  end
end

Main.start
