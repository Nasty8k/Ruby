# frozen_string_literal: true

class Person
  attr_accessor :money
  attr_reader :health, :mana, :happiness, :tiredness

  def initialize(health: 100, mana: 0, happiness: 0, money: 0, tiredness: 0)
    self.health = health
    self.mana = mana
    self.happiness = happiness
    self.tiredness = tiredness
    self.money = money
  end

  def dead?
    health <= 0 || happiness <= -10
  end

  def health=(val)
    @health = val > 100 ? 100 : val
  end

  def mana=(val)
    @mana = if val > 100
              self.health = health - (val - 100)
              100
            elsif val.negative?
              0
            else
              val
            end
  end

  def happiness=(val)
    @happiness = val > 10 ? 10 : val
  end

  def tiredness=(val)
    @tiredness = if val > 100
                   self.health = health - (val - 100)
                   100
                 elsif val.negative?
                   0
                 else
                   val
                 end
  end
end
