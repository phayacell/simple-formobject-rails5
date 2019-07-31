class User < ApplicationRecord
  has_one :profile, foreign_key: "id", dependent: :destroy, inverse_of: :user

  validates :email, presence: true
end
