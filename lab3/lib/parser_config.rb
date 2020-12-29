# frozen_string_literal: true

require 'yaml'
require 'open-uri'
require_relative 'action'
Dir['./action/*.rb'].each { |file| require_relative file }

class ParserConfig
  CONFIG_FILENAME = 'config.yml'

  def initialize(person, actions)
    @person = person
    @actions = actions
    parse_config
  end

  private

  def parse_config
    config_not_found unless File.exist?(CONFIG_FILENAME)
    data = YAML.load_file(CONFIG_FILENAME)
    change_initial data['initial'] if data.include?('initial')
    create_actions data['actions'] if data.include?('actions')
  end

  # change initial values
  def change_initial(data)
    data.each { |i| @person.send("#{i['field'].to_sym}=", + i['value']) }
  end

  def create_actions(data)
    i = 1
    data.each do |act|
      new_act = Action.new name: act['name'],
                           desc: act['description'],
                           effects: act['effects'].map { |eff| create_effect(eff) },
                           conds: create_cond(act),
                           add_conds: create_add_cond(act)
      @actions.store(i.to_s, new_act)
      i += 1
    end
  end

  def create_effect(data)
    Action::Effect.new field: data['field'],
                       value: data['value']
  end

  def create_cond(data)
    return [] if data['condition'].nil?

    data['condition'].map do |cond|
      Action::Cond.new field: cond['field'],
                       operator: cond['operator'],
                       value: cond['value']
    end
  end

  def create_add_cond(data)
    return [] if data['additional_cond'].nil?

    data['additional_cond'].map do |add_cond|
      Action::AddCond.new conds: create_cond(add_cond),
                          effects: add_cond['effects'].map { |eff| create_effect(eff) }
    end
  end

  def config_not_found
    url = "https://raw.githubusercontent.com/shu512/ruby_stuby/master/2lab/lib/#{CONFIG_FILENAME}"
    IOAdapter.instance.output "#{CONFIG_FILENAME} not found. Config download..."
    Kernel.open(url) do |config|
      File.open(CONFIG_FILENAME, 'w') { |f| f.write(config.read) }
    end
    IOAdapter.instance.output "Done.\n\n"
  rescue SocketError
    abort('Crush: network error.')
  end
end
