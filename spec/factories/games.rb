# frozen_string_literal: true

FactoryBot.define do
  sequence :titles do |n|
    "Title test ##{n}"
  end

  factory :game do
    title { generate(:titles) }
    genre { 'Horror' }
    platform { 'Windows' }
    release { '2007-04-29' }
  end
end
