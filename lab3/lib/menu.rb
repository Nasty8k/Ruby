# frozen_string_literal: true

require_relative 'save_load'

class Menu
  def initialize(person, actions_container)
    @model = Model.new(person, actions_container)
    @person = person
  end

  def start_menu
    IOAdapter.instance.output "1. Начать новую игру\n2. Продолжить игру"
    start = IOAdapter.instance.input 'Выберите действие:'
    case start
    when '1'
      @model.run
    when '2'
      SaveLoad.load(@person)
      @model.run
    end
  end
end
