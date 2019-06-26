class Game < ApplicationRecord
  has_many :users
  has_many :rounds
  belongs_to :user
  validates :code, presence: true
end
