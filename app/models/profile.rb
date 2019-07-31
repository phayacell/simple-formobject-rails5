class Profile < ApplicationRecord
  belongs_to :user, foreign_key: "id", inverse_of: :profile

  validates :name, presence: true
  validates :address, presence: true
end
