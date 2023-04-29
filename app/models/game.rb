# frozen_string_literal: true

# will be used to store game characteristics
class Game < ApplicationRecord
  validates :title, presence: true
end
