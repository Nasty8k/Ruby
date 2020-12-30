# frozen_string_literal: true

require_relative '../../lib/actions/effect'
require_relative '../../lib/person'
require 'rspec'

describe Action::Effect do
  describe '#execute' do
    subject { effect.execute person }

    let(:person) { Person.new health: 50 }

    context 'when the health increased by 30' do
      let(:effect) { Action::Effect.new field: :health, value: 30 }
      it { is_expected.to eq(80) }
    end

    context 'when the health increased by 100' do
      let(:effect) { Action::Effect.new field: :health, value: 100 }
      it { is_expected.to eq(100) }
    end

    context 'when the health decreased by 100' do
      let(:effect) { Action::Effect.new field: :health, value: -100 }
      it { is_expected.to eq(-50) }
    end
  end
end
