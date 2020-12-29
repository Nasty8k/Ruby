# frozen_string_literal: true

require_relative '../lib/actions_container'
require 'rspec'

describe ActionsContainer do
  it '#avaliable_actions' do
    init_container = {
      1 => double('Action'),
      2 => double('Action')
    }
    allow(init_container[1]).to receive(:valid?) { true }
    allow(init_container[2]).to receive(:valid?) { false }

    allowed = ActionsContainer.new(init_container).avaliable_actions('')
    check = { 1 => init_container[1] }

    expect(allowed).to eq check
  end
end
