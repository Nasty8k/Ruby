# frozen_string_literal: true

class Model
  PARAMETERS = %w[health mana happiness tiredness money].freeze

  def initialize(person, actions_container)
    @person = person
    @actions_container = actions_container
    @stack = []
  end

  def run
    until @person.dead?
      print_info
      value = IOAdapter.instance.input 'Выберите действие:'
      next_command = @actions_container.avaliable_actions(@person)[value]
      unless next_command.nil?
        @stack.push(@person.clone)
        next_command.execute(@person)
      end
      additional_actions(value)
    end
    print_parameters
    IOAdapter.instance.output 'Валера умер :(' # alias output ?
  end

  def additional_actions(value)
    case value
    when 'z'
      from_stack = @stack.pop
      @person = from_stack unless from_stack.nil?
    when 'save', 's'
      SaveLoad.save(@person)
      IOAdapter.instance.output 'Успешно сохранено'
    when 'load', 'l'
      SaveLoad.load(@person)
      IOAdapter.instance.output 'Успешно загружено'
    end
  end

  def print_info
    print_parameters
    print_actions
  end

  def print_actions
    IOAdapter.instance.output "\nДействия:"
    actions = @actions_container.avaliable_actions(@person)
    actions.each { |key, value| IOAdapter.instance.output("#{key} - #{value.name}") }
    IOAdapter.instance.output 'Введите save, чтобы сохранить данные'
    IOAdapter.instance.output 'Введите load, чтобы считать данные из файла'
  end

  def print_parameters
    PARAMETERS.each { |param| IOAdapter.instance.output "#{param} is #{@person.send param}" }
  end
end
