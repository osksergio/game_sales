class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  acts_as_token_authenticatable User

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, presence: :true
  validates :is_admin, inclusion: { in: [true, false] }
  validates :age, numericality: { greater_than_or_equal_to: 10, message: 'Idade mínima 10 anos' }
end
