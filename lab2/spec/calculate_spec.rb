# frozen_string_literal: true

require 'rspec'
require_relative '../lib/csv_calc'

RSpec.describe CSVcalc do
  describe '.csv calculate' do
    let(:csv) { CSVcalc.new('spec/test.csv') }
    array = [-1, 0, 1, 2, 3, 4, 5, 6, 7]
    context 'Search min' do
      it { expect(csv.min(array)).to eq(-1) }
    end

    context 'Search max' do
      it { expect(csv.max(array)).to eq 7 }
    end

    context 'Calculate mean' do
      it { expect(csv.mean(array)).to eq 4.5 }
    end

    context 'Calculate correct sample variance' do
      it { expect(csv.sample_variance(array)).to eq 12.38 }
    end
  end
end
