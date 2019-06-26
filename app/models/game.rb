class Game < ApplicationRecord
  has_many :users
  has_many :rounds
  validates :code, presence: true
end
