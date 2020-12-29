# frozen_string_literal: true

require 'singleton'

class IOAdapter
  include Singleton

  def output(msg)
    $stdout.puts msg
  end

  def input(msg = '')
    output(msg)
    $stdin.gets.chomp
  end
end
