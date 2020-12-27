# frozen_string_literal: true

require_relative '../lib/converter_ckf'
require 'rspec'

RSpec.describe ConverterCKF do
  describe '.converter' do
    context 'From C to F' do
      it { expect(ConverterCKF.convert(35, 'C', 'F')).to eq 95 }
    end

    context 'From C to K' do
      it { expect(ConverterCKF.convert(35, 'C', 'K')).to eq 308 }
    end

    context 'From C to C' do
      it { expect(ConverterCKF.convert(35, 'C', 'C')).to eq 35 }
    end

    context 'From F to C' do
      it { expect(ConverterCKF.convert(35, 'F', 'C')).to eq 1 }
    end

    context 'From F to K' do
      it { expect(ConverterCKF.convert(35, 'F', 'K')).to eq 290 }
    end

    context 'From F to F' do
      it { expect(ConverterCKF.convert(35, 'F', 'F')).to eq 35 }
    end

    context 'From K to C' do
      it { expect(ConverterCKF.convert(35, 'K', 'C')).to eq -238 }
    end

    context 'From K to F' do
      it { expect(ConverterCKF.convert(35, 'K', 'F')).to eq -396 }
    end

    context 'From K to K' do
      it { expect(ConverterCKF.convert(35, 'K', 'K')).to eq 35 }
    end

  end
end
