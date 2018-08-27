class User < ApplicationRecord

  devise :database_authenticatable, :registerable, :confirmable,
  :recoverable, :rememberable, :validatable, :omniauthable, :omniauth_providers => [:facebook]

end
