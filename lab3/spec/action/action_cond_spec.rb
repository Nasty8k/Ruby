# frozen_string_literal: true

require_relative '../../lib/actions/cond'
require_relative '../../lib/person'
require 'rspec'

describe Action::Cond do
  describe '#valid?' do
    let(:cond) do
      Action::Cond.new field: :health, operator: '<', value: 50
    end

    subject { cond.valid? person }

    context 'when the cond is valid' do
      let(:person) { Person.new health: 30 }
      it { is_expected.to be_truthy } # be true?
    end

    context 'when the cond is not valid' do
      let(:person) { Person.new health: 100 }
      it { is_expected.to be_falsey }
    end
  end
end
