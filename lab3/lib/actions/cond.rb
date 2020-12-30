# frozen_string_literal: true

class Action
  class Cond
    attr_accessor :field, :operator, :value

    def initialize(field:, operator:, value:)
      self.field = field
      self.operator = operator
      self.value = value
    end

    def valid?(person)
      actual_value = person.send field
      actual_value.send operator, value
    end
  end
end
