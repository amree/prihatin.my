class User < ApplicationRecord
  has_many :campaigns
  has_many :donations
  has_many :user_providers

  devise(
    :database_authenticatable,
    :registerable,
    :recoverable,
    :rememberable,
    :trackable,
    :validatable,
    :omniauthable,
    omniauth_providers: [:facebook]
  )
end
