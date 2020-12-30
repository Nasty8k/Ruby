# frozen_string_literal: true

require_relative '../lib/person'
require 'rspec'

describe Person do
  let(:person) { Person.new(health: health, mana: mana, happiness: happiness) }
  let(:health) { 100 }
  let(:mana) { 0 }
  let(:happiness) { 0 }

  describe '#dead?' do
    subject { person.dead? }
    context 'when the person health < 0' do
      let(:health) { -5 }
      it { is_expected.to be true }
    end

    context 'when the person health > 0' do
      let(:health) { 50 }
      it { is_expected.to be false }
    end

    context 'when the person happiness > -10' do
      let(:happiness) { 5 }
      it { is_expected.to be false }
    end

    context 'when the person happiness < -10' do
      let(:happiness) { -15 }
      it { is_expected.to be true }
    end
  end

  describe '#mana=' do
    subject { person.mana }
    let(:mana) { 130 }

    it { expect(subject).to eq(100) }
    it { expect(person.health).to eq(70) }
  end

  describe '#mana not negative' do
    subject { person.mana }
    let(:mana) { -10 }

    it { expect(subject).to eq(0) }
  end

end
