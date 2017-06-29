class Campaign < ApplicationRecord
  ACTIVE = "active".freeze

  belongs_to :organizer, class_name: "User", foreign_key: "user_id"

  has_many :donations
end
