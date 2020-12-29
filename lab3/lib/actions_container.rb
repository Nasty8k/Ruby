# frozen_string_literal: true

class ActionsContainer
  attr_accessor :actions

  def initialize(actions)
    @actions = actions
  end

  def avaliable_actions(person)
    @actions.select { |_key, value| value.valid?(person) }
  end
end
