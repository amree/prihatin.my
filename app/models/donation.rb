class Donation < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :campaign

  has_one :payment
end
