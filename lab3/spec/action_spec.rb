# frozen_string_literal: true

require_relative '../lib/actions/cond'
require_relative '../lib/actions/effect'
require_relative '../lib/action'
require_relative '../lib/person'
require 'rspec'

describe Action do
  let(:cond) { [].push Action::Cond.new field: :health, operator: '<', value: 50 }
  let(:eff) { [].push Action::Effect.new field: :health, value: 5 }
  let(:person) { Person.new health: 40 }
  subject { Action.new name: 'test', conds: cond, effects: eff }

  describe '#valid?' do
    context 'when the conds is valid' do
      it { expect(subject.valid?(person)).to be_truthy }
    end
  end

  describe '#execute' do
    context 'when health should be increased by 5' do
      it { expect(subject.execute(person)).to eq([45]) }
    end
  end
end
