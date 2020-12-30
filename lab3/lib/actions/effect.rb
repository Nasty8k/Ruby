# frozen_string_literal: true

class Action
  class Effect
    attr_accessor :field, :value

    def initialize(field:, value:)
      self.field = field
      self.value = value
    end

    def execute(person)
      new_value = person.send(field) + value
      person.send("#{field}=", new_value)
    end
  end
end
