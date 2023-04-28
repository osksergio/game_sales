FactoryBot.define do
  factory :user do
    username { 'Nome do usuário' }
    email { 'test@test.com' }
    password { '12345678' }
    password_confirmation { '12345678' }
    age { 18 }
    is_admin { true }
  end
end
