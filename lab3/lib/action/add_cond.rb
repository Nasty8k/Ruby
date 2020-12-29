# frozen_string_literal: true

class Action
  class AddCond
    attr_accessor :conds, :effects

    # cond(ition)s - array of Action::Cond
    # effects - array of Action::Effect

    def initialize(conds:, effects:)
      self.conds = conds
      self.effects = effects
    end

    def execute(person)
      return unless conds.inject(true) { |sum, cond| sum && cond.valid?(person) }

      (effects.map { |i| i.execute(person) }).flatten
    end
  end
end
