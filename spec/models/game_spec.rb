# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Game, type: :model do
  describe 'factory' do
    context 'when using standard factory' do
      it { expect(build(:game)).to be_valid }
    end
  end

  describe 'validations' do
    context 'when game has no title' do
      it { expect(build(:game, title: nil)).not_to be_valid }
    end

  end
end
