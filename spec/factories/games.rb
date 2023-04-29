# frozen_string_literal: true

FactoryBot.define do
  factory :game do
    title { 'Resident Evil 4' }
    genre { 'Horror' }
    platform { 'Windows' }
    release { '2007-04-29' }
  end
end
