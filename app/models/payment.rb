class Payment < ApplicationRecord
  DUE = "due".freeze
  PAID = "paid".freeze

  belongs_to :donation
end
