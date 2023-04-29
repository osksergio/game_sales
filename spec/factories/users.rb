# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    username { 'shephardjack' }
    email { 'test@test.com' }
    password { '12345678' }
    password_confirmation { '12345678' }
    age { 18 }
    is_admin { true }
  end
end
