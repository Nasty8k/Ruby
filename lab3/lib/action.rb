# frozen_string_literal: true

# effects - array of Action::Effect
# cond(ition)s - array of Action::Cond
# add_cond(ition) - array of Action::Cond - additional conditions
#   for additional effects

class Action
  attr_accessor :name, :desc, :effects, :conds, :add_conds

  def initialize(name:, conds:, effects:, desc: '', add_conds: [])
    self.name = name
    self.desc = desc
    self.effects = effects
    self.conds = conds
    self.add_conds = add_conds
  end

  def valid?(person)
    conds.inject(true) { |sum, cond| sum && cond.valid?(person) }
  end

  def execute(person)
    return unless valid? person

    add_conds.map { |cond| cond.execute(person) }
    effects.map { |eff| eff.execute(person) }
  end
end
