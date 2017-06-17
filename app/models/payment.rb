class Payment < ApplicationRecord
  DUE = "due".freeze
  PAID = "paid".freeze
  BILLPLZ_FEE = 1.5

  belongs_to :donation
end
