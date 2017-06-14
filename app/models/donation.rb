class Donation < ApplicationRecord
  belongs_to :campaign

  has_many :payments
end
