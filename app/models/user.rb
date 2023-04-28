class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  acts_as_token_authentication_handler_for User

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
