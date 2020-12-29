# frozen_string_literal: true

require_relative 'game'
require_relative 'parser_config'
require_relative 'menu'
require_relative 'person'
require_relative 'actions_container'
require_relative 'io_adapter'

person = Person.new
actions = {}
ParserConfig.new(person, actions)
actions_container = ActionsContainer.new(actions)
Menu.new(person, actions_container).start_menu
