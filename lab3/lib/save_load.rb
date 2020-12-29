# frozen_string_literal: true

class SaveLoad
  FILENAME = 'save.valera'
  PARAMETERS = %w[health mana happiness tiredness money].freeze
  def self.load(person)
    parameters = File.open(FILENAME, 'r', &:read)
    parameters = parameters.split
    i = 0
    PARAMETERS.each do |param|
      person.send("#{param}=", parameters[i].to_i)
      i += 1
    end
  end

  def self.save(person)
    File.open(FILENAME, 'w') unless File.zero?(FILENAME)
    PARAMETERS.each do |param|
      File.open(FILENAME, 'a') { |file| file.write("#{person.send param} ") }
    end
  end
end
